# Jungle

A mini e-commerce application built with Rails 6.1 for learning about Rails. 

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.
More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

## Screenshots

![Home Page](https://github.com/nathan-ts/jungle-rails/blob/main/docs/intro.jpg)
![Products](https://github.com/nathan-ts/jungle-rails/blob/main/docs/products.jpg)
![View Product](https://github.com/nathan-ts/jungle-rails/blob/main/docs/product-view.jpg)
![Empty Cart](https://github.com/nathan-ts/jungle-rails/blob/main/docs/cart-empty.jpg)
![Cart](https://github.com/nathan-ts/jungle-rails/blob/main/docs/cart.jpg)
![View Category](https://github.com/nathan-ts/jungle-rails/blob/main/docs/category.jpg)
![Pay with Card](https://github.com/nathan-ts/jungle-rails/blob/main/docs/pay-with-card.jpg)
![Order](https://github.com/nathan-ts/jungle-rails/blob/main/docs/order.jpg)
![Sign-up](https://github.com/nathan-ts/jungle-rails/blob/main/docs/signup.jpg)
![Logged In](https://github.com/nathan-ts/jungle-rails/blob/main/docs/logged-in.jpg)
![Login](https://github.com/nathan-ts/jungle-rails/blob/main/docs/login.jpg)
![Admin Login](https://github.com/nathan-ts/jungle-rails/blob/main/docs/admin-login.jpg)
![Admin Dashboard](https://github.com/nathan-ts/jungle-rails/blob/main/docs/dashboard.jpg)
![Admin Product Management](https://github.com/nathan-ts/jungle-rails/blob/main/docs/admin-products.jpg)
![Admin Category Management](https://github.com/nathan-ts/jungle-rails/blob/main/docs/admin-categories.jpg)
![Admin Category Added](https://github.com/nathan-ts/jungle-rails/blob/main/docs/added-category.jpg)