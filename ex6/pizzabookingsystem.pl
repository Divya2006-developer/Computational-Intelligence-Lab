pizza(margherita, small, 200).
pizza(margherita, medium, 350).
pizza(margherita, large, 500).

pizza(pepperoni, small, 300).
pizza(pepperoni, medium, 450).
pizza(pepperoni, large, 600).

pizza(veggie, small, 250).
pizza(veggie, medium, 400).
pizza(veggie, large, 550).


topping(cheese, 50).
topping(mushrooms, 30).
topping(olives, 40).


book_pizza(Type, Size, Topping, TotalPrice) :-
    pizza(Type, Size, BasePrice),
    topping(Topping, ToppingPrice),
    TotalPrice is BasePrice + ToppingPrice,
    format('You booked a ~w ~w pizza with ~w.~n', [Size, Type, Topping]),
    format('Total Price: ~w INR.~n', [TotalPrice]).


book_simple(Type, Size, TotalPrice) :-
    pizza(Type, Size, TotalPrice),
    format('You booked a ~w ~w pizza.~n', [Size, Type]),
    format('Total Price: ~w INR.~n', [TotalPrice]).

