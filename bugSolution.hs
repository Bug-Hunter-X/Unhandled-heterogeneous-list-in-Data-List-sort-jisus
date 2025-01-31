```haskell
import Data.List (sort)
import Data.Maybe (fromMaybe)

main :: IO ()
main = do
  let nums = [1, 5, 2, 8, 3]
  let heterogeneousNums = [1, "hello", 3.14]

  let sortedNums = sort nums
  print sortedNums

  -- Robust handling of heterogeneous lists
  let sortedHeterogeneousNums = sortHelper heterogeneousNums
  print sortedHeterogeneousNums

--Helper Function to handle potential errors in heterogeneous lists using Maybe
sortHelper :: (Ord a) => [a] -> Maybe [a] 
sortHelper xs = case all ("1" == show x) xs of
    True -> Just (sort xs)
    False -> Nothing


--Alternative using Either for more informative error handling
sortHelper2 :: (Ord a) => [a] -> Either String [a]
sortHelper2 xs = case all ("1" == show x) xs of
    True -> Right (sort xs)
    False -> Left "List contains incomparable types"

main2 :: IO ()
main2 = do
    let result = fromMaybe [] (sortHelper heterogeneousNums) --handling maybe with default value
    print result
    let result2 = either (const []) id (sortHelper2 heterogeneousNums) --handling either
    print result2
```