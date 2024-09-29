import 'package:flutter_course/ex3_movieUI/movie.dart';

String imageUrl(String name) => 'images/movies/$name';

final trendings = [
  Movie(name: 'Blue Beetle', imgUrl: imageUrl('bluebeetle.jpg')),
  Movie(name: 'Light House', imgUrl: imageUrl('lighthouse.jpg')),
  Movie(name: 'Five Nights', imgUrl: imageUrl('fivenights.jpg')),
  Movie(name: 'The Wild Robot', imgUrl: imageUrl('wildrobot.jpg')),
  Movie(name: 'Coco', imgUrl: imageUrl('coco.jpg')),
];

final movies = [
  Movie(name: 'Alien', imgUrl: imageUrl('aliean.jpg')),
  Movie(name: 'Black Phone', imgUrl: imageUrl('blackphone.jpg')),
  Movie(name: 'Captain Underware', imgUrl: imageUrl('captain.jpg')),
  Movie(name: 'Dead Pool', imgUrl: imageUrl('deadpool.jpg')),
  Movie(name: 'Finding Dory', imgUrl: imageUrl('dory.jpg'))
];

final tvs = [
  Movie(name: 'Hell Boy', imgUrl: imageUrl('hellboy.jpg')),
  Movie(name: 'Incredibles', imgUrl: imageUrl('incredibles.jpg')),
  Movie(name: 'IronMan', imgUrl: imageUrl('ironman.jpg')),
  Movie(name: 'Rock Dog', imgUrl: imageUrl('rockdog.jpg')),
  Movie(name: 'Venom', imgUrl: imageUrl('venom.jpg')),
];

final suggestions = [
  Movie(name: 'Spider Man No Way Home', imgUrl: imageUrl('spider.jpg')),
  Movie(name: 'Sonic', imgUrl: imageUrl('sonic.jpg')),
  Movie(name: 'Gemini Man', imgUrl: imageUrl('gemini.jpg')),
  Movie(name: 'Bad Guys', imgUrl: imageUrl('badguys.jpg')),
  Movie(name: 'Wonder Woman', imgUrl: imageUrl('wonder.jpg'))
];
