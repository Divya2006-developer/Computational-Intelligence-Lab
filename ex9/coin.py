def make_amount(rupees_to_make,no_of_five,no_of_one):
    five_needed=0
    one_needed=0
    f=rupees_to_make//5
    o=rupees_to_make%5
    if(f <= no_of_five and o <= no_of_one):
        five_needed=f
        one_needed=o
        print(five_needed)
        print(one_needed)
    else:
        print("-1")

rupees_to_make=19
no_of_five=3
no_of_one=3
make_amount(rupees_to_make,no_of_five,no_of_one)
