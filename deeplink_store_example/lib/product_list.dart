// Copyright 2019 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

import 'model/products_repository.dart';
import 'row_item.dart';
import 'styles.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> children =
        ProductsRepository.loadProducts()
            .map<Widget>((Product p) => RowItem(product: p))
            .toList();
    return Scaffold(
      backgroundColor: Styles.scaffoldBackground,
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            title: Text('Material Store', style: Styles.productListTitle),
            backgroundColor: Styles.scaffoldAppBarBackground,
            pinned: true,
          ),
          SliverList(delegate: SliverChildListDelegate(children)),
        ],
      ),
    );
  }
}
