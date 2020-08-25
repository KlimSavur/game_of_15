#ifndef GAME_H
#define GAME_H
#include<QAbstractListModel>

class Game: public QAbstractListModel
{
    Q_OBJECT
public:
    Game(QObject *parent = 0);
    int rowCount( const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &parent, int role) const override;
    Q_INVOKABLE void move(int index);
    Q_INVOKABLE void shuffle();
    void isWin();
    bool checkBoard() const;
signals:
    void openPopup();
protected:
    QHash<int, QByteArray> roleNames() const override;
private:
    QList<int> m_numbers;
    QHash<int, QByteArray> m_roleNames;
    enum RoleNames{
        NumberRole = Qt::UserRole
    };

};

#endif // GAME_H
