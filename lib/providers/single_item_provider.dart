import 'package:flutter/material.dart';

class IndividualItem {
  @required
  int productId;
  @required
  String productName;
  @required
  String imageUrl;
  @required
  String category;
  @required
  double originalPrice;
  @required
  int weight;
  @required
  int weightCategory;
  @required
  List<int> availableWeights;
  @required
  String description;
  double discountedAmount;
  bool isFavourite;

  IndividualItem(
      {this.productId,
      this.productName,
      this.imageUrl,
      this.category,
      this.originalPrice,
      this.weightCategory,
      this.weight,
      this.isFavourite = false,
      this.description,
      this.availableWeights,
      this.discountedAmount});
}

class ShoppingItems with ChangeNotifier {
  List<String> weightUnit = ['g', 'kg', 'ml', 'l', 'pcs'];
  static List<IndividualItem> itemsList = [
    IndividualItem(
      productId: 01,
      productName: 'Tomato',
      imageUrl: 'assets/images/individual_items/Tomato_item.png',
      weight: 500,
      originalPrice: 74,
      category: 'Vegetables',
      weightCategory: 1,
      discountedAmount: 40,
      description:
          'The tomato is the edible, often red berry of the plant Solanum lycopersicum, commonly known as a tomato plant. The species originated in western South America and Central America. The Nahuatl (the language used by the Aztecs) word tomatl gave rise to the Spanish word tomate, from which the English word tomato derived.',
      availableWeights: [500, 1, 2, 3],
    ),
    IndividualItem(
      productId: 02,
      productName: 'Onion',
      imageUrl: 'assets/images/individual_items/Onion_item.jpg',
      weight: 500,
      originalPrice: 50,
      weightCategory: 1,
      category: 'Vegetables',
      description:
          'The onion (Allium cepa L., from Latin cepa "onion"), also known as the bulb onion or common onion, is a vegetable that is the most widely cultivated species of the genus Allium. Its close relatives include the garlic, scallion, shallot, leek, chive,[2] and Chinese onion.[3]',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 03,
      productName: 'Carrot',
      imageUrl: 'assets/images/individual_items/Carrot_item.jpg',
      weight: 500,
      originalPrice: 50,
      category: 'Vegetables',
      weightCategory: 1,
      discountedAmount: 40,
      description:
          'The carrot (Daucus carota subsp. sativus) is a root vegetable, usually orange in color, though purple, black, red, white, and yellow cultivars exist.[2][3][4] They are a domesticated form of the wild carrot, Daucus carota, native to Europe and Southwestern Asia. The plant probably originated in Persia and was originally cultivated for its leaves and seeds. ',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 04,
      productName: 'Capsicum',
      imageUrl: 'assets/images/individual_items/Chilly_item.png',
      weight: 500,
      originalPrice: 30,
      category: 'Vegetables',
      weightCategory: 1,
      discountedAmount: 25,
      description:
          'Capsicum (/ˈkæpsɪkəm/[3]) is a genus of flowering plants in the nightshade family Solanaceae. Its species are native to the Americas, where they have been cultivated for thousands of years. Capsicums are cultivated worldwide and used in many cuisines.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 05,
      productName: 'Apple',
      imageUrl: 'assets/images/individual_items/Apple_item.jpg',
      weight: 500,
      originalPrice: 74,
      category: 'Fruits',
      weightCategory: 1,
      discountedAmount: 60,
      description:
          'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today. Apples have been grown for thousands of years in Asia and Europe and were brought to North America by European colonists.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 06,
      productName: 'Orange',
      imageUrl: 'assets/images/individual_items/Orange_item.png',
      weight: 500,
      originalPrice: 75,
      category: 'Fruits',
      weightCategory: 1,
      discountedAmount: 70,
      description:
          'The orange is the fruit of various citrus species in the family Rutaceae (see list of plants known as orange); it primarily refers to Citrus × sinensis,[1] which is also called sweet orange, to distinguish it from the related Citrus × aurantium, referred to as bitter orange.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 07,
      productName: 'Strawberry',
      imageUrl: 'assets/images/individual_items/Strawberry_item.png',
      weight: 500,
      originalPrice: 75,
      category: 'Fruits',
      weightCategory: 1,
      description:
          'The garden strawberry (or simply strawberry; Fragaria × ananassa)[1] is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit. The fruit is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 08,
      productName: 'Mango',
      imageUrl: 'assets/images/individual_items/Mango_item.jpg',
      weight: 500,
      originalPrice: 55,
      category: 'Fruits',
      weightCategory: 1,
      discountedAmount: 40,
      description:
          'The garden strawberry (or simply strawberry; Fragaria × ananassa)[1] is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit. The fruit is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 09,
      productName: 'Apple Juice',
      imageUrl: 'assets/images/individual_items/AppleJuice_item.png',
      weight: 100,
      originalPrice: 30,
      weightCategory: 2,
      category: 'Beverages',
      description:
          'The garden strawberry (or simply strawberry; Fragaria × ananassa)[1] is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit. The fruit is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 10,
      productName: 'Pineapple Juice',
      imageUrl: 'assets/images/individual_items/PineappleJuice_item.png',
      weight: 100,
      originalPrice: 30,
      weightCategory: 2,
      category: 'Beverages',
      description:
          'The garden strawberry (or simply strawberry; Fragaria × ananassa)[1] is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit. The fruit is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 11,
      productName: ' Tomato Juice',
      imageUrl: 'assets/images/individual_items/TomatoJuice_item.png',
      weight: 100,
      originalPrice: 30,
      category: 'Beverages',
      weightCategory: 2,
      discountedAmount: 20,
      description:
          'The garden strawberry (or simply strawberry; Fragaria × ananassa)[1] is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit. The fruit is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 12,
      productName: 'Packed Mango Juice',
      imageUrl: 'assets/images/individual_items/PakedJuice_item.png',
      weight: 100,
      originalPrice: 50,
      weightCategory: 2,
      category: 'Beverages',
      description:
          'The garden strawberry (or simply strawberry; Fragaria × ananassa)[1] is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit. The fruit is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 13,
      productName: 'Eggs',
      imageUrl: 'assets/images/individual_items/Egg_item.png',
      weight: 1,
      originalPrice: 5,
      weightCategory: 4,
      category: 'Groceries',
      description:
          'The garden strawberry (or simply strawberry; Fragaria × ananassa)[1] is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit. The fruit is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 14,
      productName: 'Brown Eggs',
      imageUrl: 'assets/images/individual_items/BrownEggs_item.jpg',
      weight: 1,
      originalPrice: 9,
      weightCategory: 4,
      category: 'Groceries',
      description:
          'The garden strawberry (or simply strawberry; Fragaria × ananassa)[1] is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit. The fruit is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 15,
      productName: 'Basmathi Rice',
      imageUrl: 'assets/images/individual_items/BasmathiRice_item.jpg',
      weight: 500,
      originalPrice: 55,
      category: 'Groceries',
      weightCategory: 1,
      discountedAmount: 40,
      description:
          'The garden strawberry (or simply strawberry; Fragaria × ananassa)[1] is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit. The fruit is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 16,
      productName: 'Packed Dhall',
      imageUrl: 'assets/images/individual_items/PackedDhall_item.jpg',
      weight: 50,
      originalPrice: 20,
      category: 'Groceries',
      weightCategory: 0,
      discountedAmount: 18,
      description:
          'The garden strawberry (or simply strawberry; Fragaria × ananassa)[1] is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit. The fruit is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 17,
      productName: 'Ponni Rice',
      imageUrl: 'assets/images/individual_items/PonniRice_item.jpg',
      weight: 500,
      originalPrice: 500,
      category: 'Groceries',
      weightCategory: 1,
      description:
          'The garden strawberry (or simply strawberry; Fragaria × ananassa)[1] is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit. The fruit is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness.',
      discountedAmount: 475,
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 18,
      productName: 'Taco Shells',
      imageUrl: 'assets/images/individual_items/TacoShells_item.jpg',
      weight: 10,
      originalPrice: 55,
      category: 'Groceries',
      weightCategory: 4,
      discountedAmount: 40,
      description:
          'The egg is the organic vessel containing the zygote in which an embryo develops until it can survive on its own, at which point the animal hatches. An egg results from fertilization of an egg cell. Most arthropods, vertebrates (excluding live-bearing mammals), and mollusks lay eggs, although some, such as scorpions, do not.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 19,
      productName: 'Beans',
      imageUrl: 'assets/images/individual_items/Beans_item.jpg',
      weight: 50,
      originalPrice: 55,
      category: 'Groceries',
      weightCategory: 0,
      discountedAmount: 40,
      description:
          'The egg is the organic vessel containing the zygote in which an embryo develops until it can survive on its own, at which point the animal hatches. An egg results from fertilization of an egg cell. Most arthropods, vertebrates (excluding live-bearing mammals), and mollusks lay eggs, although some, such as scorpions, do not.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 20,
      productName: 'Colgate Toothpaste',
      imageUrl: 'assets/images/individual_items/Colgate_item.png',
      weight: 100,
      originalPrice: 45,
      weightCategory: 0,
      category: 'Groceries',
      description:
          'The egg is the organic vessel containing the zygote in which an embryo develops until it can survive on its own, at which point the animal hatches. An egg results from fertilization of an egg cell. Most arthropods, vertebrates (excluding live-bearing mammals), and mollusks lay eggs, although some, such as scorpions, do not.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 21,
      productName: 'Colgate Maxfresh ToothPaste ',
      imageUrl: 'assets/images/individual_items/ColgateMaxFresh_item.png',
      weight: 100,
      description:
          'The egg is the organic vessel containing the zygote in which an embryo develops until it can survive on its own, at which point the animal hatches. An egg results from fertilization of an egg cell. Most arthropods, vertebrates (excluding live-bearing mammals), and mollusks lay eggs, although some, such as scorpions, do not.',
      originalPrice: 50,
      weightCategory: 0,
      category: 'Groceries',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 22,
      productName: 'Colgate Mouthwash',
      imageUrl: 'assets/images/individual_items/ColgateMouthWash_item.png',
      weight: 50,
      originalPrice: 55,
      category: 'Groceries',
      weightCategory: 0,
      discountedAmount: 40,
      description:
          'The egg is the organic vessel containing the zygote in which an embryo develops until it can survive on its own, at which point the animal hatches. An egg results from fertilization of an egg cell. Most arthropods, vertebrates (excluding live-bearing mammals), and mollusks lay eggs, although some, such as scorpions, do not.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 23,
      productName: 'Colgate White',
      imageUrl: 'assets/images/individual_items/ColgateWhite_item.png',
      weight: 100,
      originalPrice: 70,
      category: 'Groceries',
      weightCategory: 0,
      description:
          'The egg is the organic vessel containing the zygote in which an embryo develops until it can survive on its own, at which point the animal hatches. An egg results from fertilization of an egg cell. Most arthropods, vertebrates (excluding live-bearing mammals), and mollusks lay eggs, although some, such as scorpions, do not.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 24,
      productName: 'Taco Shells',
      imageUrl: 'assets/images/individual_items/TacoShells_item.jpg',
      weight: 50,
      originalPrice: 55,
      category: 'Groceries',
      weightCategory: 4,
      discountedAmount: 40,
      description:
          'The egg is the organic vessel containing the zygote in which an embryo develops until it can survive on its own, at which point the animal hatches. An egg results from fertilization of an egg cell. Most arthropods, vertebrates (excluding live-bearing mammals), and mollusks lay eggs, although some, such as scorpions, do not.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 25,
      productName: 'Milk',
      imageUrl: 'assets/images/individual_items/Milk_item.png',
      weight: 500,
      originalPrice: 40,
      category: 'Dairy Products',
      weightCategory: 3,
      discountedAmount: 40,
      description:
          'The egg is the organic vessel containing the zygote in which an embryo develops until it can survive on its own, at which point the animal hatches. An egg results from fertilization of an egg cell. Most arthropods, vertebrates (excluding live-bearing mammals), and mollusks lay eggs, although some, such as scorpions, do not.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 26,
      productName: 'IceCream',
      imageUrl: 'assets/images/individual_items/IceCream_item.png',
      weight: 250,
      originalPrice: 210,
      category: 'Dairy Products',
      weightCategory: 2,
      discountedAmount: 230,
      description:
          'The egg is the organic vessel containing the zygote in which an embryo develops until it can survive on its own, at which point the animal hatches. An egg results from fertilization of an egg cell. Most arthropods, vertebrates (excluding live-bearing mammals), and mollusks lay eggs, although some, such as scorpions, do not.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 27,
      productName: 'Cheese',
      imageUrl: 'assets/images/individual_items/Cheese_item.png',
      weight: 50,
      originalPrice: 55,
      category: 'Dairy Products',
      weightCategory: 0,
      discountedAmount: 40,
      description:
          'The egg is the organic vessel containing the zygote in which an embryo develops until it can survive on its own, at which point the animal hatches. An egg results from fertilization of an egg cell. Most arthropods, vertebrates (excluding live-bearing mammals), and mollusks lay eggs, although some, such as scorpions, do not.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 28,
      productName: 'Ashirvaad',
      imageUrl: 'assets/images/individual_items/Aashirvaad_item.jpg',
      weight: 500,
      originalPrice: 150,
      category: 'Groceries',
      weightCategory: 1,
      discountedAmount: 130,
      description:
          'The egg is the organic vessel containing the zygote in which an embryo develops until it can survive on its own, at which point the animal hatches. An egg results from fertilization of an egg cell. Most arthropods, vertebrates (excluding live-bearing mammals), and mollusks lay eggs, although some, such as scorpions, do not.',
      availableWeights: [500,1,2,3
      ],
    ),
    IndividualItem(
      productId: 29,
      productName: 'Carrot Juice',
      imageUrl: 'assets/images/individual_items/CarrotJuice_item.png',
      weight: 100,
      originalPrice: 50,
      weightCategory: 2,
      category: 'Beverages',
      description:
          'The egg is the organic vessel containing the zygote in which an embryo develops until it can survive on its own, at which point the animal hatches. An egg results from fertilization of an egg cell. Most arthropods, vertebrates (excluding live-bearing mammals), and mollusks lay eggs, although some, such as scorpions, do not.',
      availableWeights: [500,1,2,3
      ],
    ),
  ];

  final List<IndividualItem> featuredProducts = [
    ...ShoppingItems.getDiscountedData
  ];
  final bestValues = [...ShoppingItems.getDiscountedData.toList()..shuffle()];
  final freshArrivals = [
    ...ShoppingItems.getDiscountedData.toList()..shuffle()
  ];

  void changeFavourites(int id, products) {
    IndividualItem prod =
        products.firstWhere((element) => (element.productId == id));
    prod.isFavourite = !prod.isFavourite;
  }
  void changeFavouriteOfaProducts(int id) {
    IndividualItem prod =
    itemsList.firstWhere((element) => (element.productId == id));
    prod.isFavourite = !prod.isFavourite;
  }


  void removeFavouritesFromFavouriteScreen(int id) {
    IndividualItem favProd =
        itemsList.firstWhere((element) => (element.productId == id));
    favProd.isFavourite = false;
    notifyListeners();
  }

  IndividualItem findById(int id) {
    return itemsList.firstWhere((element) => element.productId == id);
  }

  static List<IndividualItem> get getDiscountedData {
    return [
      ...itemsList.where(
        (product) => product.discountedAmount != null,
      ),
    ];
  }

  List<IndividualItem> searchByCategory(String category) {
    return [
      ...itemsList.where((element) => element.category == category).toList()
    ];
  }
}
