#import libraries
import pandas as pd
import random
import os
from faker import Faker

#initialize Faker for generating fake data
fake = Faker()

#define the number of records
num_books = 100
num_authors = 20
num_members = 200
num_transactions = 150

#generate authors
authors = {
    'author_id': [i for i in range(1, num_authors+1)],
    'name': [fake.name() for _ in range(num_authors)],
    'bio': [fake.text(max_nb_chars = 200) for _ in range(num_authors)]
}

authors_df = pd.DataFrame(authors)

#generate books
genre = ['Fiction', 'Non-fiction', 'Science', 'Fantasy', 'Biography', 'Mystery']
books = {
    'book_id': [i for i in range(1, num_books + 1)],
    'title': [fake.sentence(nb_words=3)[:-1] for _ in range(num_books)], #removes the last period
    'author_id': [random.randint(1, num_authors) for _ in range(num_books)],
    'genre': [random.choice(genre) for _ in range(num_books)],
    'isbn': [fake.isbn13() for _ in range(num_books)],
    'published_date': [fake.date_between(start_date='-50y', end_date='today') for _ in range(num_books)]
}

books_df = pd.DataFrame(books)

#generate members
members = {
    'member_id': [i for i in range(1, num_members+1)],
    'first_name': [fake.first_name() for _ in range(num_members)],
    'last_name': [fake.last_name() for _ in range(num_members)],
    'email': [fake.email() for _ in range(num_members)],
    'phone': [fake.phone_number() for _ in range(num_members)]
}

members_df = pd.DataFrame(members)

#generate transactions
transactions = {
    'transaction_id': [i for i in range(1, num_transactions + 1)],
    'book_id': [random.randint(1, num_books) for _ in range(num_transactions)],
    'member_id': [random.randint(1, num_members) for _ in range(num_transactions)],
    'borrow_date': [fake.date_between(start_date='-1y', end_date='today') for _ in range(num_transactions)],
    'return_date': [fake.date_between(start_date='today', end_date='+30d') for _ in range(num_transactions)]
}

transactions_df = pd.DataFrame(transactions)



#creating a directory to save the CSV files
output_directory = 'Library Data'
os.makedirs(output_directory, exist_ok=True) 

#saving the DataFrames into csv files
authors_df.to_csv(os.path.join(output_directory, 'authors.csv'), index=False)
books_df.to_csv(os.path.join(output_directory, 'books.csv'), index=False)
members_df.to_csv(os.path.join(output_directory, 'members.csv'), index=False)
transactions_df.to_csv(os.path.join(output_directory, 'transactions.csv'), index=False)

print(f"Sample data for Authors, Books, Members, and Transactions has been generated and saved in the '{output_directory}' folder.")