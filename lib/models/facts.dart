import 'dart:math';

List<String> facts = [
  'UNICEF has reported a total of 72 incidents across Myanmar in the first four months of 2021.',
  'Landmines are generally buried 6 inches (15 centimeters) under the surface or simply laid above ground. Buried landmines can remain active for more than 50 years.',
  'Landmines come in two categories, anti-personnel landmines and anti-tank landmines. An anti-personnel landmine is designed to injure or kill a person, while an anti-tank landmine is designed to incapacitate tanks or other vehicles.',
  'The countries most affected by landmines are Afghanistan, Angola, Cambodia, Iraq, China, Egypt and Laos. Mines are also a serious problem in Bosnia, Croatia, Georgia, Mozambique, Myanmar, Nicaragua, Somalia, Sri Lanka and Sudan.',
  'One person is killed by a landmine every 15 minutes. About 70 people are killed by a landmine every day. 26,000 people a year become landmine victims. A total of over one million people have been killed or maimed by landmines.',
  'Only 10% of landmine victims have access to appropriate health care and rehabilitation services.',
  '80 percent of landmine victims are civilians.25 percent of landmine victims are children.',
  'A landmine costs just \$3 to manufacture and nearly \$1,000 to remove.',
  'It is estimated that it will take 450 years to clear the world of undetected landmines.',
  'Landmines kill two people every hour of every day.',
  'It is estimated that there are 110 million land mines in the ground right now. An equal amount is in stockpiles waiting to be planted or destroyed.'
      'The cost of removing all existing mines would be \$50- to \$100-billion.',
  'According to the ‘International Campaign to Ban Landmines network’, more than 4,200 people, of whom 42% are children, have been falling victim to landmines and ERWs annually in many of the countries affected by war or in post-conflict situations around the world.',
  'According to Landmine Monitor, number of landmine and UXO casualties was 11,700 in 2002 and 4286 in 2011.',
  'Mines kill or maim more than 5,000 people annually.',
  'Mine and explosive remnant of war casualties occur in every region of the world, causing an estimated 15,000 – 20,000 injuries each year.',
  'One deminer is killed and two injured for every 5000 successfully removed mines.',
  'Overall, about 85 per cent of reported land mine casualties are men, many of whom are soldiers. However, in some regions, 30 per cent of the victims are women.',
  'Mines create millions of refugees or internally displaced people',
  'Until recently, about 100 000 mines were being removed, and about two million more were planted each year.',
  'If demining efforts remain about the same as they are now, and no new mines are laid, it will still take 1100 years to get rid of all the world’s active land mines.',
  'For the military, mine detection rates of 80% are accepted since all the military needs are a quick breach in a minefield. For humanitarian mine clearing it is obvious that the system must have a detection rate approaching the perfection of 99.6%.',
  'The most common injury associated with land mines is loss of one or more limbs. In the United States, the rate of amputation is 1 for every 22 000 people. In Angola, it is 30 for every 10 000.',
];

String getFact() {
  final _random = Random();
  return facts[_random.nextInt(facts.length)];
}
