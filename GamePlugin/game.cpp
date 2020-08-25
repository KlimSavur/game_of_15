#include "game.h"
#include <QtGui>
Game::Game(QObject *parent)
    :QAbstractListModel(parent)
{
    m_roleNames[NumberRole] = "number";
    for (int i = 1; i < 17; ++i){
        m_numbers.append(i);
    }
    shuffle();
}

int Game::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_numbers.count();
}

QVariant Game::data(const QModelIndex& index, int role) const{
    int row = index.row();
    if (row < 0 || row >= m_numbers.count()){
        return QVariant();
    }
    switch (role) {
        case RoleNames::NumberRole:
        return m_numbers.at(row);
    }
    return QVariant();
}

void Game::move(int pos)
{
    if (pos < 0|| pos >= m_numbers.count())
        return;
    if (m_numbers.at(pos) == 16){
        return;
    }
    if (pos <= 11){
        if (m_numbers.at(pos+4) == 16){
            emit beginMoveRows(QModelIndex(), pos, pos, QModelIndex(),pos+5);
            m_numbers.move(pos, pos+4);
            emit endMoveRows();
            emit beginMoveRows(QModelIndex(), pos+3, pos+3, QModelIndex(),pos);
            m_numbers.move(pos+3, pos);
            emit endMoveRows();
            isWin();
            return;
        }
    }
    if (pos >= 4){
        if (m_numbers.at(pos-4) == 16){
            emit beginMoveRows(QModelIndex(), pos, pos, QModelIndex(),pos-4);
            m_numbers.move(pos, pos-4);
            emit endMoveRows();
            emit beginMoveRows(QModelIndex(), pos-3, pos-3, QModelIndex(),pos+1);
            m_numbers.move(pos-3, pos);
            emit endMoveRows();
            isWin();
            return;
        }
    }
    if (pos >= 1){
        if (m_numbers.at(pos-1) == 16){
            emit beginMoveRows(QModelIndex(), pos, pos, QModelIndex(),pos-1);
            m_numbers.move(pos, pos-1);
            emit endMoveRows();
            isWin();
            return;
        }
    }
    if (pos <= 14){
        if (m_numbers.at(pos+1) == 16){
            emit beginMoveRows(QModelIndex(), pos, pos, QModelIndex(),pos+2);
            m_numbers.move(pos, pos+1);
            emit endMoveRows();
            isWin();
            return;
        }
    }
}

void Game::shuffle()
{
    emit beginResetModel();
    std::random_shuffle(m_numbers.begin(), m_numbers.end());
    while (!checkBoard()){
        std::random_shuffle(m_numbers.begin(), m_numbers.end());
    }
    emit endResetModel();
}

void Game::isWin()
{
    int counter = 0;
    while ((counter+1) == m_numbers.at(counter)){
        counter++;
        if (counter == 15){
            emit openPopup();
            return;
        }
    }
    return;
}


bool Game::checkBoard() const
{
    int sum = 0;
    for (int i = 0; i <= 15; i++){
        if (m_numbers.at(i) == 16){
            sum = sum + floor(i/4) + 1;
            continue;
        }
        for (int j =i+1; j <= 15; j++)
            if (m_numbers.at(i) > m_numbers.at(j)){
                sum++;
            }
    }
    return !(sum%2);
}

QHash<int, QByteArray> Game::roleNames() const
{
    return m_roleNames;
}

