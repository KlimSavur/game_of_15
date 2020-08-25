#include "gameplugin_plugin.h"

#include "game.h"

#include <qqml.h>

void GamePluginPlugin::registerTypes(const char *uri)
{
    // @uri Game
    qmlRegisterType<Game>(uri, 1, 0, "Game");
}

