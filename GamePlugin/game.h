#pragma once

#include<QAbstractListModel>

class Game: public QAbstractListModel
{
    Q_OBJECT
public:
    Game(QObject *parent = nullptr);
    int rowCount(const QModelIndex&) const override;
    QVariant data(const QModelIndex &parent, int role) const override;
    Q_INVOKABLE void move(int index);
    Q_INVOKABLE void shuffle();
signals:
    void openPopup() const;
private:
    void checkWin() const;
    bool checkBoard() const;
    void applyMove(const int& pos,const int& first_offset, const int& second_offset = 0);
    QList<int> m_numbers;

};

