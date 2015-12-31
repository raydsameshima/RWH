BookStore.lhs

> data BookInfo = Book Int String [String]
>                 deriving (Show)
> data MagazineInfo = Magazine Int String [String]
>                     deriving (Show)
>
> myInfo = Book 9780135072455 "Algebra of Programming"
>               ["Richard Bird", "Oega de Moor"]
>
> book0 = Book 0 "The Book of Imaginary Beings" ["Jorge Luis Borges"]
> book1 = Book 1 "Cosmicomics" ["Italo Calvino"] 
>
> type CustomerID = Int
> type ReviewBody = String
> data BookReview = BookReview BookInfo CustomerID ReviewBody
>
> type BookRecord = (BookInfo, BookReview)

> type CardHolder = String
> type CardNumber = String
> type Address = [String]
>
> data BillingInfo 
>   = CreditCard CardNumber CardHolder Address
>   | CashOnDerivery
>   | Invoice CustomerID
>   deriving (Show)
>
> data Customer = Customer 
>   { customerID      :: CustomerID
>   , customerName    :: String
>   , customerAddress :: Address
>   }
>   deriving (Show)
> 
> customer1 = Customer 271828 "J.R. Hacker"
>             ["255 Syntax Ct", "Milpitas, CA 95134", "USA"]
> customer2 = Customer
>   {  customerID = 271828
>   ,  customerAddress = ["1048587 Disk Drive",
>                         "Milpitas, CA 95134",
>                         "USA"]
>   ,  customerName = "Jane Q. Citizen"
>   }
