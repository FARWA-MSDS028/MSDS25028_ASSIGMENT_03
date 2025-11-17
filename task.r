#install.packages("data.table")
#install.packages("ggplot2")
library(data.table)
library(ggplot2)
film          <- fread("film.csv")
language      <- fread("language.csv")
actor         <- fread("actor.csv")
film_actor    <- fread("film_actor.csv")
category      <- fread("category.csv")
film_category <- fread("film_category.csv")
rental        <- fread("rental.csv")
inventory     <- fread("inventory.csv")
customer      <- fread("customer.csv")
payment       <- fread("payment.csv")
staff         <- fread("staff.csv")
store         <- fread("store.csv")


head(film)
View(head(film))

res1 <- film[rating == "PG" & rental_duration > 5]
View(res1)
