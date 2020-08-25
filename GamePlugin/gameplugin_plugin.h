#ifndef GAMEPLUGIN_PLUGIN_H
#define GAMEPLUGIN_PLUGIN_H

#include <QQmlExtensionPlugin>

class GamePluginPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void registerTypes(const char *uri) override;
};

#endif // GAMEPLUGIN_PLUGIN_H
