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
res2 <- film[release_year == 2006, .N]

h <- film[
  , .(avg_rental_rate = mean(rental_rate, na.rm=TRUE)),
  by = rating
][order(-avg_rental_rate)]



films_lang <- merge(
  film, language,
  by = "language_id",
  all.x = TRUE)
View(films_lang)


cust_store <- merge(customer, store, by = "store_id", all.x = TRUE)
cust_store[, full_name := paste(first_name, last_name)]
q4 <- cust_store[, .(customer_id, full_name, store_id)]
View(q4)



pay_staff <- merge(payment, staff, by = "staff_id", all.x = TRUE)
pay_staff[, staff_full := paste(first_name, last_name)]
q5 <- pay_staff[, .(payment_id, amount, payment_date, staff_full)]
View(q5)



# find rented inventory IDs
rented <- merge(inventory, rental, by = "inventory_id")

# films that were rented
rented_ids <- unique(rented$film_id)
"q6_output.csv"
# films NOT rented
q6 <- film[!film_id %in% rented_ids]
View(q6)
