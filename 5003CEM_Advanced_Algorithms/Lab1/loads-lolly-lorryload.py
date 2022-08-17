"""
For this task, you need to write code which works out, given an inventory of products, what is the
consignment to be loaded onto a lorry with weight limit n, which has the greatest possible value. 
Inventory can be given as a list of item object
A lorry can carry at most n kilograms. The name of the materials, the amount of material in kilograms
and the material price per kilo are known. Compute a load composition in such a way that the value
(price) of the load is maximum.

Input:
    n = 1000
    
    gold 400kg 100
    copper 700kg 65
    plastic 150 kg 50
Output:
    Load composition value = 79000
    400 kg of gold and 600 kg of copper
    Output string stating the Load composition value and what it contains

"""

class Item:
    def __init__(self, name, weight, price):
        self.name = name
        self.weight = weight
        self.price = price

def loadLorry(inventory, n):
    weightResult = 0
    for item in inventory:
        print(item.price)
    print("went here")

# main

total_inventory = [Item("gold",400, 100),Item("copper",700, 65),Item("plastic",150, 50)]

loadLorry(total_inventory,100)