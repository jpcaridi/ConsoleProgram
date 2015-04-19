using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.Entity;
using System.Linq;
using System.Text;

namespace ConsoleProgram
{
    class Program
    {
        static void Main(string[] args)
        {
            DataModelContainer modelContainer = new DataModelContainer();
            DbConnection connection = modelContainer.Database.Connection;
            connection.ConnectionString = ConnectionString();
            connection.Open();

            var customers = modelContainer.Customers.ToList();

            foreach (Customer c in customers)
            {
                Console.Out.WriteLine("Name: {0} Email: {1}", c.Name, c.Email);
                Console.Out.WriteLine("Address: {0}", c.Address);

                Account customerAccount = c.Account;
                if (customerAccount != null)
                {
                    Console.Out.WriteLine("Account Creation: {0}\n", c.Account.CreationDate);

                    if (c.Name.Equals("John Caridi"))
                    {
                        if (customerAccount.ShoppingCart == null)
                        {
                            customerAccount.ShoppingCart = new ShoppingCart { Account = customerAccount };
                        }

                        var products = modelContainer.Products.ToList();
                        foreach (Product p in products)
                        {
                            if (!customerAccount.ShoppingCart.Products.Contains(p))
                                customerAccount.ShoppingCart.Products.Add(p);
                        }
                    }
                }
            }

            modelContainer.SaveChanges();

            /*Account account = Account.CreateAccount(0, DateTime.Now);
            customer.Account = account;
            ShoppingCart cart = ShoppingCart.CreateShoppingCart(1);
            account.ShoppingCart = cart;


            Product car = Product.CreateProduct(123456, "Car");
            cart.Products.Add(car);



            account.Orders = new System.Data.Objects.DataClasses.EntityCollection<Order>();
            account.Orders.Add(Order.CreateOrder(123, DateTime.Now, account.Id));

            Console.Out.WriteLine("Account creation date: " + customer.Account.CreationDate);
            Console.Out.WriteLine("Customer Address: " + customer.Address);*/

            connection.Close();
            Console.In.Read();
        }
        public static string ConnectionString()
        {
            return "data source=LAPPYPAD;Database=testing;user id=caridi;Password=6319576431;MultipleActiveResultSets=True;App=EntityFramework";
        }
    }

}
