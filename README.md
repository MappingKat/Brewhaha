Brewhaha
========

![image](http://ocbrewfest.com/2013admin/wp-content/uploads/2013/05/logo-lg1.png)

This is a rails app for ordering beverages at a brewery.  It is an online ordering system that offers both administrator and consumer interfaces.  You set up your credit card to open your tab and order as many beverages as your bac can hold. 

Learning Goals
---------------

Use TDD to drive all layers of Rails development including unit, integration, and user acceptance tests
Design a system of models which use one-to-one, one-to-many, and many-to-many relationships
Practice mixing HTML, CSS, and Rails templates to create an inviting and usable User Interface
Differentiate responsibilities between components of the Rails stack
Build a logical user-flow that moves across multiple controllers and models
Understandings

Please consider the requirements below non-exhaustive guidelines for building a great customer experience. If you know something should be done but it isn’t listed below, do it.

Restrictions

Project implementation may not use:

Devise for Authentication
A pre-existing, externally created CSS/HTML design/template
Getting Started



Unauthenticated Users
---------------------

As an unauthenticated user, I can:

Browse all drinks
Browse drinks by category
Add a drink to tab
View tab
Remove a drink from my tab
Increase the quantity of drinks in my tab
Log in, which should not clear the tab

Unauthenticated users are NOT allowed to:

View another user’s private data (such as current order, etc.)
Checkout (until they log in)
View the administrator screens or use administrator functionality
Make themselves an administrator
Authenticated Non-Administrators

Allowed To:

do everything Unauthenticated Users can do except "log in"
log out
view their past orders with links to display each order
on that order display page there are:
items with quantity ordered and line-item subtotals
links to each item description page
the current status of the order
order total price
date/time order was submitted
if completed or cancelled, display a timestamp when that action took place
if any item is retired from the menu:
they can still access the item page
they cannot add it to a new cart
NOT allowed to:

view another user’s private data (such as current order, etc.)
view the administrator screens or use administrator functionality
make themselves an administrator

Administrators
--------------
Create item listings including a name, description, price, and a photo
Modify existing items’ name, description, price, and photo
Create named categories for items (eg: "Small Plates")
Assign items to categories or remove them from categories. Products can belong to more than one category.
Retire a item from being sold, which hides it from browsing by any non-administrator
As an Administrator, I can also view an order "dashboard" where I can:

See a listing of all orders with:
the total number of orders by status
links for each individual order
filter orders to display by status type (for statuses "ordered", "paid", "cancelled", "completed")
link to transition to a different status:
link to "cancel" individual orders which are currently "ordered" or "paid"
link to "mark as paid" orders which are "ordered"
link to "mark as completed" individual orders which are currently "paid"
Access details of an individual order, including:
Order date and time
Purchaser full name and email address
For each item on the order
Name with link to item page
Quantity
Price
Line item subtotal
Total for the order
Status of the order
Update an individual order
View and edit orders; may change quantity or remove items from orders with the status of pending or paid
Change the status of an order according to the rules as outlined above
NOT allowed to:

Modify any personal data aside from their own
Data Validity

There are several types of entities in the system, each with requirements about what makes for a valid record. These restrictions are summarized below.

Any attempt to create/modify a record with invalid attributes should return the user to the input form with a validation error indicating the problem along with suggestions how to fix it.

Item

An item must have a title, description, and price.
The title and description cannot be empty strings.
The title must be unique for all items in the system
The price must be a valid decimal numeric value and greater than zero
The photo is optional. If present it must be a valid URL format.
User

A user must have a valid email address that is unique across all users
A user must have a full name that is not blank
A user may optionally provide a display name that must be no less than 2 characters long and no more than 32
Order

An order must belong to a user
An order must be for one or more of one or more items currently being sold
Example Data

To support the evaluation process, please make the following available via the rake db:seed task in your application:

Items
At least 20 items of varying prices
Some of the items should be attached to multiple categories
Categories
At least 5 categories with a varying number of member items
Orders
At least 10 sample orders, with at least two at each stage of fulfillment (ordered, completed, cancelled)
Users
Normal user with full name "Franklin Webber", email address "demo+franklin@jumpstartlab.com", password of "password" and no display name
Normal user with full name "Jeff", email address "demo+jeff@jumpstartlab.com", password of "password" and display name "j3"
User with admin priviliges with full name "Katrina Owen", email address "demo+katrina@jumpstartlab.com", password of "password", and display name "kytrinyx"
Submission Guidelines

Your project must be "live" on the web for your peers to evaluate it. We recommend you deploy it on Heroku.

Your README file on Github should contain a link to your live site.

On the production site, setup the URL path /code to redirect the user to the Github repository.


Resources
=========
*Beer Images: http://www.wix.com/website-template/view/html/778?originUrl=http%3A%2F%2Ftile_lp
*Brewery Databases: http://www.brewerydb.com/about/beer101
*Beer Icons: http://www.iconspedia.com/icon/beer-700.html
*More icons: http://findicons.com/search/beer
*Cool icons: http://www.ryandavidkoziel.com/wp-content/uploads/2013/09/bw-glasses.png
