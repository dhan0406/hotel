What classes does each implementation include? Are the lists the same?
  Each implementation has three classes: CartEntry, ShoppingCart, Order.

Write down a sentence to describe each class.
  CartEntry - this class keeps track of each entry and its price and the quantity
  ShoppingCart - this class keeps track of all entries in a cart
  Order - this class keeps track of each cart which is an instance of a ShoppingCart

How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.
  Implementation A refers to both CartEntry and ShoppingCart in the Order class. We iterate through @cart.entries to access each entry and its unit_price and quantity.

  Implementation B refers to ShoppingCart class to create an instance of it to @cart. The total_price is calculated by calling @cart.price which is the #price method in ShoppingCart. Within this method we refer to the #price method in CartEntry which is (@unit_price * @quantity).

What data does each class store? How (if at all) does this differ between the two implementations?
  In Implementation A and B, CartEntry, ShoppingCart, and Order store the state of its instances. 

What methods does each class have? How (if at all) does this differ between the two implementations?
  In Implementation A, Order class is the master class in which #total_price method carries out all the logic and is in charge of all behavior of instances of the two other classes.

  In Implementation B, the responsibility is delegated between all three classes. Each class has an instance method that determines the price. So, ShoppingCart calls on the #price method in CartEntry class and Order calls on the #price method of the ShoppingCart class.

Consider the Order#total_price method. In each implementation:
Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?
Does total_price directly manipulate the instance variables of other classes?
  As mentioned in the above response, the responsibility is delegated to lower level classes in Implementatio B. 
  In Implementation A, the prices are computed in the Order class and the instance variables are manipulated.

If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
  I think Implementation B would be easier to modify because we can add in a conditional in the #price method in the CartEntry class that will take off a discounted amount if the @quantity is over a certain number.

Which implementation better adheres to the single responsibility principle?
  Implementation B better adheres to the single responsibility principle because each class has a responbility of its behavior & state.

Hotel improvements:
  A place where I can implement change is to add a #overlap method in the DateRange class and calling that method in BookingSystem class to check if the given date range overlaps with any previously made reservations.


