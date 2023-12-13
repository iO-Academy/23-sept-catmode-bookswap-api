# 23-sept-catmode-bookswap-fe

# Description 
Working as part of a team of 6 developers, using mobbing and pair programming we were tasked to build a Book Swap API that connects to the front end website we previously built that manages a communal bookshelf.  
This API was built to the following document specification https://github.com/iO-Academy/book-swap-api-docs/blob/main/README.md. All routes were thoroughly tested using route tests to ensure project future maintainabilty.

On the website the users can:

* See all the books that are available for borrowing
* Claim a book, so that they can later grab it from the actual shelf
* See all the books that are currently “claimed“
* Return” a book, to signify that they have put it back on the shelf
* Review a book
* Add a new book to the system, if a new book has been added to the shelf search and filter books

### This API project was built using PHP, Laravel, Sequel Ace, Postman.

## Authors
* Kellie Marsh - @ Kel-E-Creator
* Henry Meager - @henrymeager 
* Andrei Trifu - @andrei-trifu
* Timothy Williamson - @GDTimi
* Siphosenkosi Ndlouv - @Sipho-Ndlovu
* Sophie Preston - @W1z4rdK1tty

## Installation
1. Make sure Docker is running
2. clone the repo into your chosen folder
3. cd into your chosen folder
4. Run artisan composer install
5. Open the project in VSC
6. Duplicate the .env.example file
7. Rename copied file to .env
8. Amend DB_HOST/DB_DATABASE/DB_USERNAME/DB_PASSWORD 
9. Run PHP artisan key:generate
10. Create a new MySQL database with the same name you listed in  DB_DATABASE
11. Run artisan migrate
12. Run php artisan serve --host=0.0.0.0. 
