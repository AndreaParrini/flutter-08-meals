import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yout Filters'),
      ),
      /* drawer: MainDrawer(
        onSelectScreen: (identifier) {
          Navigator.of(context).pop();
          if (identifier == 'meals') {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
            // .pushReplacement(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
            // * sostituendo push con pushReplacement, si evita che la funzione torna indietro non funzioni in quanto la schermata che si aprirà andrà a sosituire quella esistente,
            // * mentre con push non la sosituisce ma veine inserita nella lista lasciando quelle vecchie dietro.
          }
        },
      ),
       */
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChceked) {
                setState(() {
                  _glutenFreeFilterSet = isChceked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'Only include gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeThumbColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChceked) {
                setState(() {
                  _lactoseFreeFilterSet = isChceked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'Only include lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeThumbColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegetarianFilterSet,
              onChanged: (isChceked) {
                setState(() {
                  _vegetarianFilterSet = isChceked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'Only include vegetarian meals.',
                style: Theme.of(context).textTheme.labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeThumbColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChceked) {
                setState(() {
                  _veganFilterSet = isChceked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'Only include vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeThumbColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
