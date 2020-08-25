#include "game.h"
#include <QtGui>

Game::Game(QObject *parent)
    :QAbstractListModel(parent)
{
    for (int i = 1; i < 17; ++i){
        m_numbers.append(i);
    }
    shuffle();
}

int Game::rowCount(const QModelIndex&) const
{
    return m_numbers.count();
}

QVariant Game::data(const QModelIndex& index, int role) const{
    int row = index.row();
    if (row < 0 || row >= m_numbers.count()){
        return QVariant();
    }
    if (role == Qt::DisplayRole){
        return m_numbers.at(row);
    }
    return QVariant();
}

void Game::move(int pos)
{
    if (pos < 0|| pos >= m_numbers.count()){
        return;
    }
    if (m_numbers.at(pos) == 16){
        return;
    }
    if (pos >= 1){
        if (m_numbers.at(pos - 1) == 16){
            applyMove(pos, -1);
            return;
        }
    }
    if (pos >= 4){
        if (m_numbers.at(pos - 4) == 16){
            applyMove(pos, -4, -3);
            return;
        }
    }
    if (pos <= 11){
        if (m_numbers.at(pos + 4) == 16){
            applyMove(pos, 4, 3);
            return;
        }
    }
    if (pos <= 14){
        if (m_numbers.at(pos + 1) == 16){
            applyMove(pos, 1);
            return;
        }
    }

    return;
}
void Game::applyMove(const int& pos,const int& first_offset, const int& second_offset){
    if (first_offset){
        emit beginMoveRows(QModelIndex(), pos, pos, QModelIndex(), pos + ((first_offset > 0) ? (first_offset + 1) : first_offset));
        m_numbers.move(pos, pos + first_offset);
        emit endMoveRows();
        if (second_offset){
            emit beginMoveRows(QModelIndex(), pos + second_offset, pos + second_offset, QModelIndex(), pos + ((second_offset < 0) ? 1 : 0));
            m_numbers.move(pos + second_offset, pos);
            emit endMoveRows();
        }
        checkWin();
    }
}
void Game::shuffle()
{
    emit beginResetModel();
    do
    {
        std::random_shuffle(m_numbers.begin(), m_numbers.end());
    }
    while (!checkBoard());
    emit endResetModel();
}

void Game::checkWin() const
{
    for (int i = 1; (i < 17) && (i == m_numbers.at(i - 1)); ++i){
        if (i == 16){
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
            sum = sum + floor(i / 4) + 1;
        }
        else{
            for (int j = i + 1; j <= 15; j++)
                if (m_numbers.at(i) > m_numbers.at(j)){
                    sum++;
            }
        }
    }
    return !(sum % 2);
}

