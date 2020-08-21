#include "engine_plugin.h"

#include "game.h"

#include <qqml.h>

void EnginePlugin::registerTypes(const char *uri)
{
    qmlRegisterType<Game>(uri, 1, 0, "Game");
}
