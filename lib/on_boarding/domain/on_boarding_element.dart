class OnBoardingElement {
  String imageUrl, title, description;

  OnBoardingElement(
      {required this.imageUrl, required this.title, required this.description});
}

List<OnBoardingElement> getOnBoardingelements() {
  return <OnBoardingElement>[
    OnBoardingElement(
        imageUrl: 'assets/images/create-list.jpg',
        title: 'Create a list',
        description:
            'You can create a shopping list, which you can consult and modify at any time from your smartphone.'),
    OnBoardingElement(
        imageUrl: 'assets/images/share-list.jpg',
        title: 'Share your list with your friends',
        description:
            'Through a Qr code or a link that you generate and then send to your friends, you can share your shopping list with your friends. '),
    OnBoardingElement(
        imageUrl: 'assets/images/manage-list-with-friends.jpg',
        title: 'Manage your list with your friends',
        description:
            'You can manage your shopping lists with your friends that you invite to access your lists.')
  ];
}
