module Main where

import Control.Monad.IO.Class
  ( liftIO
  )

import Data.Git
  ( branchList
  , withRepo
  , RefName(..)
  )

import Data.Git.Storage
  ( openRepo
  )

import Data.Set
  ( Set(..)
  , toList
  )
import Filesystem.Path.CurrentOS 

main :: IO ()
main = do
  putStrLn "Example 1: query and print the list of git branches (in this repo)"
  repo <- openRepo $ decodeString ".git"
  branches <- Data.Git.branchList repo
  mapM_ (putStrLn . refNameRaw) $ toList branches
