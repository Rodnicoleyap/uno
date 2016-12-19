module Game where

import Common
import Shuffler

initialCardCount :: Int
initialCardCount = 4

-- TODO: Implement a method to initialize a new game given n players

--dynamic
playerNames :: [String]
playerNames = ["1-Rod", "2-Nicole", "3-Gooc", "4-Yap"]


initPlayers :: Int -> Int -> [Player]
initPlayers size 4 = []
initPlayers size cnt
    | size /= 0 && size > cnt  = HPlayer (playerNames !! cnt) [] : initPlayers size (cnt + 1)
    | cnt < 4                  = AiPlayer (playerNames !! cnt) [] : initPlayers size (cnt + 1)
 

initGame :: Int -> State
initGame n = State { players = initPlayers n 0,
                     deck = fullDeck,
                     d_stack = []}

-- TODO: Implement a method to setup the game
setupGame :: State -> IO State
setupGame gs = shuffleDeck gs
