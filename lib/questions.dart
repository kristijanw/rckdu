final allQuestions = [
  {
    'questionText': '1. Voliš li rad s ljudima?',
    'answers': [
      {'text': 'Da', 'score': 0},
      {'text': 'Ne', 'score': 0},
    ],
  },
  {
    'questionText': '2. Koliko dugo se želiš školovati?',
    'answers': [
      {
        'text': 'Želim završiti trogodišnji program',
        'score': 1,
        'profession': {'konobar', 'kuhar', 'tes', 'slasticar'},
      },
      {
        'text': 'Želim završiti četverogodišnji program',
        'score': 1,
        'profession': {'htt', 'thk', 'kt'},
      },
    ],
  },
  {
    'questionText': '3. U dobrom sam psihofizičkom stanju',
    'answers': [
      {
        'text': 'Da',
        'score': 1,
        'profession': {'konobar', 'kuhar', 'kt', 'thk'},
      },
      {
        'text': 'Ne',
        'score': 1,
        'profession': {'htt', 'slasticar'},
      },
    ],
  },
  {
    'questionText':
        '4. Volio/voljela bih se baviti zanimanjem koje uključuje interakciju s ljudima i govorno izražavanje',
    'answers': [
      {
        'text': 'Da',
        'score': 1,
        'profession': {'htt', 'konobar', 'thk'},
      },
      {
        'text': 'Ne',
        'score': 1,
        'profession': {'kuhar', 'tes', 'slasticar', 'kt', 'thk'},
      },
    ],
  },
  {
    'questionText': '5. Htio/htjela bih naučiti više stranih jezika',
    'answers': [
      {
        'text': 'Da',
        'score': 1,
        'profession': {'htt'},
      },
      {'text': 'Ne', 'score': 1},
    ],
  },
  {
    'questionText': '6. Sebe bih okarakterizirao kao',
    'answers': [
      {'text': 'povučenu osobu mirnog karaktera', 'score': 1},
      {
        'text': 'otvorenu osobu s izraženim komunikacijskim vještinama',
        'score': 1,
        'profession': {'htt', 'konobar', 'kt', 'thk'},
      },
    ],
  },
  {
    'questionText': '7. Volim poslove u kojima mogu izraziti svoju kreativnost',
    'answers': [
      {
        'text': 'Da',
        'score': 1,
        'profession': {'kuhar', 'kt', 'slasticar'},
      },
      {
        'text': 'Ne',
        'score': 1,
        'profession': {'konobar', 'tes', 'htt', 'thk'},
      },
    ],
  },
  {
    'questionText': '8. Više volim pripremati',
    'answers': [
      {
        'text': 'Slana',
        'score': 1,
        'profession': {'kuhar', 'kt'},
      },
      {
        'text': 'Slatka jela',
        'score': 1,
        'profession': {'slasticar'},
      },
    ],
  },
  {
    'questionText': '9. Dobro podnosim stresne situacije',
    'answers': [
      {
        'text': 'Jako dobro',
        'score': 1,
        'profession': {'konobar', 'htt', 'thk'},
      },
      {
        'text': 'Dobro',
        'score': 1,
        'profession': {'kt', 'kuhar', 'slasticar'},
      },
      {
        'text': 'Loše',
        'score': 1,
        'profession': {'slasticar', 'tes'},
      },
    ],
  },
  {
    'questionText':
        '10. Zahtjevni uvjeti poput vremenskih prilika, rada na otvorenom mi predstavljaju problem',
    'answers': [
      {
        'text': 'Da',
        'score': 1,
        'profession': {'kuhar', 'slasticar', 'kt', 'tes'},
      },
      {
        'text': 'Ne',
        'score': 1,
        'profession': {'thk', 'konobar'},
      },
    ],
  },
  {
    'questionText': '11. Sebe u budućnosti vidim na nekom rukovodećem mjestu',
    'answers': [
      {'text': 'Da', 'score': 1},
      {'text': 'Ne', 'score': 1},
    ],
  },
  {
    'questionText':
        '12. Želim se baviti poslom u kojem se mogu konstantno usavršavati i napredovati',
    'answers': [
      {'text': 'Da', 'score': 1},
      {
        'text': 'Ne',
        'score': 1,
        'profession': {'tes', 'konobar'},
      },
    ],
  },
  {
    'questionText':
        '13. Volim pomagati u kućanskim poslovima koji uključuju pripremu dnevnih obroka',
    'answers': [
      {
        'text': 'Da',
        'score': 1,
        'profession': {'slasticar', 'kt', 'kuhar'},
      },
      {
        'text': 'Ne',
        'score': 1,
        'profession': {'konobar', 'tes', 'htt', 'thk'},
      },
    ],
  },
];

final allQuestionsEng = [
  {
    'questionText': '1. Do you like working with people?',
    'answers': [
      {'text': 'Yes', 'score': 0},
      {'text': 'No', 'score': 0},
    ],
  },
  {
    'questionText': '2. How long do you want to study?',
    'answers': [
      {
        'text': 'I want to complete a three-year program',
        'score': 1,
        'profession': {'konobar', 'kuhar', 'tes', 'slasticar'},
      },
      {
        'text': 'I want to complete a four-year program',
        'score': 1,
        'profession': {'htt', 'thk', 'kt'},
      },
    ],
  },
  {
    'questionText': '3. I am in good psychophysical condition',
    'answers': [
      {
        'text': 'Yes',
        'score': 1,
        'profession': {'konobar', 'kuhar', 'kt', 'thk'},
      },
      {
        'text': 'No',
        'score': 1,
        'profession': {'htt', 'slasticar'},
      },
    ],
  },
  {
    'questionText':
        '4. I would like to do a job that involves interacting with people and speaking',
    'answers': [
      {
        'text': 'Yes',
        'score': 1,
        'profession': {'htt', 'konobar', 'thk'},
      },
      {
        'text': 'No',
        'score': 1,
        'profession': {'kuhar', 'tes', 'slasticar', 'kt', 'thk'},
      },
    ],
  },
  {
    'questionText': '5. I would like to learn more foreign languages',
    'answers': [
      {
        'text': 'Yes',
        'score': 1,
        'profession': {'htt'},
      },
      {'text': 'No', 'score': 1},
    ],
  },
  {
    'questionText': '6. I would characterize myself as',
    'answers': [
      {'text': 'A withdrawn person with a calm character', 'score': 1},
      {
        'text': 'An open person with strong communication skills',
        'score': 1,
        'profession': {'htt', 'konobar', 'kt', 'thk'},
      },
    ],
  },
  {
    'questionText': '7. I like jobs where I can express my creativity',
    'answers': [
      {
        'text': 'Yes',
        'score': 1,
        'profession': {'kuhar', 'kt', 'slasticar'},
      },
      {
        'text': 'No',
        'score': 1,
        'profession': {'konobar', 'tes', 'htt', 'thk'},
      },
    ],
  },
  {
    'questionText': '8. I prefer to prepare',
    'answers': [
      {
        'text': 'Salty food',
        'score': 1,
        'profession': {'kuhar', 'kt'},
      },
      {
        'text': 'Sweet food',
        'score': 1,
        'profession': {'slasticar'},
      },
    ],
  },
  {
    'questionText': '9. I handle stressful situations well',
    'answers': [
      {
        'text': 'Really good',
        'score': 1,
        'profession': {'konobar', 'htt', 'thk'},
      },
      {
        'text': 'Good',
        'score': 1,
        'profession': {'kt', 'kuhar', 'slasticar'},
      },
      {
        'text': 'Bad',
        'score': 1,
        'profession': {'slasticar', 'tes'},
      },
    ],
  },
  {
    'questionText':
        '10. Demanding conditions such as weather conditions and working outdoors are a problem for me',
    'answers': [
      {
        'text': 'Yes',
        'score': 1,
        'profession': {'kuhar', 'slasticar', 'kt', 'tes'},
      },
      {
        'text': 'No',
        'score': 1,
        'profession': {'thk', 'konobar'},
      },
    ],
  },
  {
    'questionText': '11. I see myself in a managerial position in the future',
    'answers': [
      {'text': 'Yes', 'score': 1},
      {'text': 'No', 'score': 1},
    ],
  },
  {
    'questionText':
        '12. I want to do a job where I can constantly improve and progress',
    'answers': [
      {'text': 'Yes', 'score': 1},
      {
        'text': 'No',
        'score': 1,
        'profession': {'tes', 'konobar'},
      },
    ],
  },
  {
    'questionText':
        '13. I like to help with household chores that include preparing the daily meals',
    'answers': [
      {
        'text': 'Yes',
        'score': 1,
        'profession': {'slasticar', 'kt', 'kuhar'},
      },
      {
        'text': 'No',
        'score': 1,
        'profession': {'konobar', 'tes', 'htt', 'thk'},
      },
    ],
  },
];

final allProfession = [
  {"title": "konobar", "score": 0},
  {"title": "kuhar", "score": 0},
  {"title": "tes", "score": 0},
  {"title": "slasticar", "score": 0},
  {"title": "htt", "score": 0},
  {"title": "thk", "score": 0},
  {"title": "kt", "score": 0},
];
