# Questions for Elixir developers

1.  Have you worked with GenStage or Flow before? If so, can you explain why and how you implemented these?

    For this time I have not used GenStage and Flow in applications for production. But if speak what is this and when I will use them I can say:
    
    GenStage: 
    
    Example when I will use it
    *   import data from another application, this application have an API with which you can fetch data by batches
    *   send data to the external application which have API using which you can send data by batches
    *   send push notifications and you don`t know the amount of push notification you should send(in one moment you have only 100 requests to sent in another 10000) 
    
    Implementation
    *   initialize Producer and Consumer. Consumer subscribes to Producer. The Consumer asks the Producer, but the Producer ignores and answers that it doesn't have any events. This response ignored by the Consumer. So both the Consumer and the Producer await for an event. 
    *   initialize Producer and Consumer. The producer has callback function `handle_demand` in which it adds an event to the state. The Consumer asks about events and when the amount of events has equal some demand the Consumer will start handle those events.
    
    Flow is a library for computational parallel flows in Elixir.

2.  Describe 2 or more efficient ways of processing a CSV file containing over 5M records, explain how each handles certain constraints and compare them.

    * Very slow and with memory lick
    
    ```
    File.read!("big.csv") # copy all file to the memmory
    |> String.split("\n") # creating a list of new strings
    |> Enum.map(&String.split(&1, ",")) # split each element from list and create a list of lists
    |> Enum.filter(fn  # filtering data (remove headers, and raws without data)
      ["Head1" | _] -> false
      [_, "NaN" | _] -> false
      _ -> true
    end)
    ```
    
    * Lazy, faster and without memory lick
    ```
    File.stream!("big.csv") # returns a Stream without opening the file
    |> Stream.map(&String.trim(&1)) # create a Streame that will apply String.trim/1
    |> Stream.map(&String.split(&1, ",")) # create a Streame that will apply String.split/2
    |> Stream.filter(fn # Creates a stream that filters elements.
      ["Head1" | _] -> false
      [_, "NaN" | _] -> false
      _ -> true
    end)
    ```

3.  Write two different functions that take a nested list of integers ([1, [1, 2, [4]]] would result in 8) and calculates the sum. Explain the process of both and explain which is more efficient and why.
    [Link on the file](list_sum_calculation.ex)
    
4.  Refactor the following code to be more efficient while keeping the same functionality: https://repl.it/@jeroenvisser101/refactor-this (Writing tests might help)
    [Link on the file](user.ex)
