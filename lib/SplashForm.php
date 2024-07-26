<?php
namespace ide\forms;

use ide\Ide;
use ide\Logger;
use ide\systems\SplashTipSystem;
use php\gui\event\UXEvent;
use php\gui\framework\AbstractForm;
use php\gui\UXImageArea;
use php\gui\UXImage;
use php\lib\str;
use php\time\Time;
use php\io\Stream;
use ide\ui\Notifications;
use php\lib\fs;
use php\io\File;

/**
 * @property UXLabel $version
 * @property UXLabel $tip
 */
class SplashForm extends AbstractIdeForm
{
    protected function init()
    {
        Logger::debug("Init form ...");

        $this->centerOnScreen();

        $this->version->text = $this->_app->getVersion();

        $versionCode = $this->_app->getConfig()->get('app.versionCode');
        if ($versionCode) {
            $this->versionCode->text = str::upperFirst($versionCode);

            $now = Time::now()->toString('dd-MM');
            $specialCode = 'res://.data/img/code/special/' . $now . '.png';

            if (Stream::exists($specialCode)) {
                $versionCode = "special/$now";
            }

            $codeImg = new UXImageArea(new UXImage('res://.data/img/code/' . $versionCode . '.png'));
            $codeImg->stretch = true;
            $codeImg->smartStretch = true;
            $codeImg->size = [64, 64];
            $codeImg->position = [690 - 64 - 14, 14];

            $this->add($codeImg);
        }

        // Hide the splash screen after 7 seconds
        waitAsync(7000, function() {
            $this->hide();

            // You can also check for updates here if needed
            $latestVersion = trim(file_get_contents("https://raw.githubusercontent.com/TrueS1gma/DevelWare-Studio/main/_update-service/version.txt"));
            $currentVersion = Ide::get()->getConfig()->get('app.version');

            if ($latestVersion === $currentVersion) {
                Notifications::success("Мастер Обновлений", "У вас установлена последняя версия DevelWare Studio " . $currentVersion);
            } else {
                Notifications::warning("Мастер Обновлений", "Обнаружено новое обновление DevelWare Studio " . $latestVersion);
                $this->_app->showForm("UpdateAvailableForm");
            }

            // Clean up update-service.jar if it exists
            $updateServicePath = "./update-service.jar";
            if (fs::isFile($updateServicePath)) {
                $file = new File($updateServicePath);
                if ($file->delete()) {
                    Logger::info('Файл успешно удален');
                } else {
                    Logger::info('Ошибка удаления');
                }
            }
        });
    }

    /**
     * @param UXEvent $e
     * @event tip.click
     */
    public function doTipClick(UXEvent $e)
    {
        $this->tip->text = SplashTipSystem::get(Ide::get()->getLanguage()->getCode());
        $e->consume();
    }

    /**
     * @event show
     */
    public function doShow()
    {
        $this->tip->text = SplashTipSystem::get(Ide::get()->getLanguage()->getCode());

        if (Ide::get()->isDevelopment() && Ide::get()->isWindows()) {
            if ($this->opacity > 0.9) {
                $this->opacity = 0.05;
            } else {
                $this->opacity = 1;
            }
        }

        uiLater(function () {
            $this->toFront();
        });
    }

    /**
     * @event click
     */
    public function hide()
    {
        parent::hide();
    }
}