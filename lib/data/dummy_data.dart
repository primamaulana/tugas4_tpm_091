import 'package:favorite_meals/models/site.dart';

const dummyMeals = [
  Meal(
    id: 'm1',
    title: 'Great Wall of China',
    deskripsi: [
      'The Great Wall of China is a series of fortifications made of stone, brick, tamped earth, wood, and other materials, generally built along an east-to-west line across the historical northern borders of China to protect the Chinese states and empires against the raids and invasions of the various nomadic groups.',
    ],
    imageUrl:
      'https://www.mustseespots.com/china/img/the-great-wall-of-china.jpg',
    location: 'China',
    year: '206 BC',
    link: 'https://en.wikipedia.org/wiki/Great_Wall_of_China',
    type: 'Wall',

  ),
  Meal(
    id: 'm2',
    title: 'Petra',
    deskripsi:[
    'Petra, originally known to its inhabitants as Raqmu, is a historical and archaeological city in southern Jordan. Petra lies around Jabal Al-Madbah in a basin surrounded by mountains which form the eastern flank of the Arabah valley that runs from the Dead Sea to the Gulf of Aqaba.',
    ],
    imageUrl:
        'https://cdn.britannica.com/24/153524-050-BA9D084B/Al-Dayr-Petra-Jordan.jpg',
    location: 'Jordan',
    year: '312 BC',
    link: 'https://en.wikipedia.org/wiki/Petra',
    type: 'Ancient City',

  ),
  Meal(
    id: 'm3',
    title: 'Colosseum',
    deskripsi: [
      'The Colosseum is an oval amphitheater in the center of the city of Rome, Italy. Built of travertine limestone, tuff, and brick-faced concrete, it was the largest amphitheater ever built at the time and held 50,000 to 80,000 spectators.',
    ],
    imageUrl:
        'https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1200,h_630/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/mufsgb1tt13ehen0iihn/Menemukan%20Masa%20Lalu%3A%20Tur%20Audio%20Mandiri%20Colosseum%20Roma%20untuk%20Perjalanan%20yang%20Mendalam.jpg',
    location: 'Italy',
    year: '70 AD',
    link: 'https://en.wikipedia.org/wiki/Colosseum',
    type: 'Amphitheater',

  ),
  Meal(
    id: 'm4',
    title: 'Machu Picchu',
    deskripsi: [
      'Machu Picchu is a 15th-century Inca citadel located in the Eastern Cordillera of southern Peru on a 2,430-meter mountain ridge. It is located in the Machupicchu District within Urubamba Province above the Sacred Valley, which is 80 kilometers northwest of Cuzco.',
    ],
    imageUrl:
        'https://media.npr.org/assets/img/2021/08/09/gettyimages-1229409136-db9b54a1546b7f503c7e812178f4cab5b707aca3-s1100-c50.jpg',
    location: 'Peru',
    year: '1450',
    link: 'https://en.wikipedia.org/wiki/Machu_Picchu',
    type: 'Ancient City',

  ),
  Meal(
    id: 'm5',
    title: 'Taj Mahal',
    deskripsi: ['The Taj Mahal is an ivory-white marble mausoleum on the right bank of the river Yamuna in the Indian city of Agra. It was commissioned in 1632 by the Mughal emperor Shah Jahan to house the tomb of his favorite wife, Mumtaz Mahal.',
    ],
    imageUrl:
        'https://asset-a.grid.id/crop/0x0:0x0/x/photo/2021/10/17/cultural-tourism-g7f26bb457_1280-20211017105256.jpg',
    location: 'India',
    year: '1632',
    link: 'https://en.wikipedia.org/wiki/Taj_Mahal',
    type: 'Mausoleum',

  ),
  Meal(
    id: 'm6',
    title: 'Chichen Itza',
    deskripsi: ['Chichen Itza was a large pre-Columbian city built by the Maya people of the Terminal Classic period. The archaeological site is located in Tinúm Municipality, Yucatán State, Mexico.',
    ],
    imageUrl:
        'https://www.colemanconcierge.com/wp-content/uploads/2021/06/Chichen-Itza-El-Castillo-scaled-1-1024x498.jpg',
    location: 'Mexico',
    year: '600 AD',
    link: 'https://en.wikipedia.org/wiki/Chichen_Itza',
    type: 'Archaeological Site',

  ),
  Meal(
    id: 'm7',
    title: 'Christ the Redeemer',
    deskripsi: [
      'Christ the Redeemer is an Art Deco statue of Jesus Christ in Rio de Janeiro, Brazil, created by French sculptor Paul Landowski and built by Brazilian engineer Heitor da Silva Costa, in collaboration with French engineer Albert Caquot.',
    ],
    imageUrl:
        'https://trips-southamerica.com/wp-content/uploads/Cristo.jpg',
    location: 'Brazil',
    year: '1931',
    link: 'https://en.wikipedia.org/wiki/Christ_the_Redeemer_(statue)',
    type: 'Statue',

  ),
  Meal(
    id: 'm8',
    title: 'Borobudur',
    deskripsi: [
      'Borobudur Temple is a Buddhist temple located in Borobudur, Magelang, Central Java, Indonesia. This temple is located approximately 100 km southwest of Semarang, 86 km west of Surakarta, and 40 km northwest of Yogyakarta. This temple with many stupas was founded by followers of Mahayana Buddhism around 800 AD during the reign of the Syailendra dynasty. Borobudur is the largest Buddhist temple or shrine in the world, as well as one of the largest Buddhist monuments in the world.',
    ],
    imageUrl:
        'https://borobudurpark.com/wp-content/uploads/2017/02/borobudur1-768x512.jpg',
    location: 'Indonesia',
    year: '800 M',
    link: 'https://id.wikipedia.org/wiki/Borobudur',
    type: 'Temple',


  ),
  Meal(
    id: 'm9',
    title: 'Roman Baths',
    deskripsi: [
      'The Roman Baths complex is a site of historical interest in the English city of Bath. The house is a well-preserved Roman site for public bathing.',
    ],
    imageUrl:
        'https://wise.com/imaginary-v2/3378c116885a3b94a36f63b6fa9ebfb2.jpg?width=1200',
    location: 'United Kingdom',
    year: '60 AD',
    link: 'https://en.wikipedia.org/wiki/Roman_Baths_(Bath)',
    type: 'Historical Site',

  ),
  Meal(
    id: 'm10',
    title: 'Statue of Liberty',
    deskripsi: [
      'The Statue of Liberty is a colossal neoclassical sculpture on Liberty Island in New York Harbor within New York City, in the United States.',
    ],
    imageUrl:
        'https://www.worldatlas.com/upload/f4/d8/7b/shutterstock-1397031029.jpg',
    location: 'United States',
    year: '1886',
    link: 'https://en.wikipedia.org/wiki/Statue_of_Liberty',
    type: 'Statue',

  ),
];
