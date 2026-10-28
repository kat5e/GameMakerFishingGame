function InventorySearch(rootObject, itemtype){
{
    for (var i = 0; i < INVENTORY_SLOTS; i += 1) {
        if (rootObject.inventory[i] == itemtype) {
            return(i);
        }
    }
}
    return(-1);
}

function InventoryRemove(rootObject, itemtype) {
    var _slot = InventorySearch(rootObject, itemtype);
    if (_slot != - 1)
    {
        with (rootObject) inventory[_slot] = -1;
            return false;
    }
    else return false;
}

function InventoryAdd(rootObject, itemtype){
    var _slot = InventorySearch(rootObject, - 1);
    if (_slot != -1) {
        with (rootObject) inventory[_slot] = itemtype;
            return true;
    }
    else return false;
    }


function InventorySwap(objectFrom, slotFrom, objectTo, slotTo) {
    var _itemFrom = objectFrom.inventory[slotFrom]
    objectFrom.inventory[slotFrom] = objectFrom.inventory[slotTo];
    objectTo.inventory[slotTo] = _itemFrom;
}