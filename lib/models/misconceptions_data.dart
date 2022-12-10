class Misconceptions {
  final int position;
  final String name;
  final String iconImage;
  final String description;

  Misconceptions(
    this.position, {
    required this.name,
    required this.iconImage,
    required this.description,
  });

  static List<Misconceptions> misconceptionsData = [
    Misconceptions(1,
        name: 'HIV is the same as AIDS',
        iconImage: 'assets/images/asset3.png',
        description: "Although it's been decades since the beginning of the pandemic, at times media outlets still do not draw the distinction between HIV (Human Immunodeficiency Syndrome) and AIDS (Acquired Immunodeficiency Syndrome). These days thanks to advances in HIV treatment, most people with HIV will never have AIDS. A person who starts HIV treatment early after testing positive can live a near normal life without their HIV ever progressing to AIDS.",
        ),
    Misconceptions(2,
        name: 'HIV can be transferred by kissing',
        iconImage: 'assets/images/asset4.png',
        description: "It's extremely unlikely you will contract HIV from kissing as HIV is not spread the saliva. If the person you are kissing has sore or bleeding gums then there is an elevated risk, but overall transmission through kissing is extremely rare.",
        ),
    Misconceptions(3,
        name: 'You can tell by looking if someone has HIV',
        iconImage: 'assets/images/asset2.png',
        description: 'There is no definite way to tell by looking at someone if they have HIV or not. Guys who have HIV and are on treatment will look like HIV negative individuals. While some people show some symptoms from the infection this is highly different for each guy, so there is no way of knowing.',
        )
  ];
}
