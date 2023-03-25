class PageFile {
  final int position;
  final String? name;
  final String? iconImage;
  final String? description;


  PageFile(
      this.position, {
        this.name,
        this.iconImage,
        this.description,

      });
}

List<PageFile> pages = [
  PageFile(0,
      name: 'Diet & Nutrition',
      iconImage: 'assets/nutrition.png',
      description:
      "Sources of calcium - Milk, cheese and other dairy foods, green leafy vegetables such as curly kale, okra. Clean sources protein to stabilize blood sugar - Cage-free eggs, wild fish, grass-fed meat or raw dairy. Foods high in fiber - vegetables, fruits, ancient grains, nuts and seeds all contribute fiber to your diet, which reduces constipation that’s linked to headaches. Healthy fats to reduce inflammation and prevent blood sugar dips - Nuts, seeds, coconut oil or olive oil, avocado, and wild-caught fish help you digest important nutrients and are important for brain function and hormonal balance. Foods high in magnesium and electrolytes - Green leafy vegetables, sweet potatoes, melon and bananas are some good sources of magnesium, which relaxes muscles.",
  ),
  PageFile(1,
    name: 'Diet & Nutrition',
    iconImage: 'assets/nutrition.png',
    description:
    "Spicy foods - Foods that contain capsaicin, such as cayenne pepper, jalapenos, and horseradish, can help clear sinuses and alleviate congestion. Citrus fruits: Citrus fruits, such as oranges, lemons, and grapefruits, are rich in vitamin C, which can help boost the immune system and reduce inflammation in the sinuses. Warm liquid - Drinking warm liquids, such as herbal tea, chicken soup, or hot water with lemon and honey, can help soothe irritated sinuses and relieve congestion. Garlic and onions - Both garlic and onions contain compounds that can help fight off infections and reduce inflammation in the sinuses. Omega-3 fatty acids - Foods rich in omega-3 fatty acids, such as salmon, flaxseed, and walnuts, can help reduce inflammation in the body, including the sinuses. Probiotic-rich foods - Foods that are rich in probiotics, such as yogurt, kefir, and fermented vegetables, can help boost the immune system and reduce inflammation in the sinuses.",
  ),
  PageFile(2,
    name: 'Lifestyle & Habits',
    iconImage: 'assets/lifestyle.png',
    description:
    "Quit Smoking - Smoking makes it easier to get an infection. Quitting smoking can help lower this risk. So can avoiding second-hand smoke and air pollution. Exercise Regularly - Exercise releases chemicals in the body that block pain signals to the brain. Talk with your health care provider about exercise and choose activities you enjoy. They might include walking, swimming or cycling. Get Enough Sleep - Wake up and go to bed at the same time every day — even on weekends. Relax before you go to bed. If you don't fall asleep within 15 minutes, get up and read or do something soothing until you're drowsy. Avoid medicines that contains caffeine or other stimulants that can affect sleep. This can include some headache medicines. Quit Alcohol - While moderate alcohol use may offer some health benefits, heavy drinking, including binge drinking — has no health benefits.",
  ),
  PageFile(3,
      name: 'Immediate Action',
      iconImage: 'assets/action.png',
      description:
      "A pulmonologist is a doctor who diagnoses and treats diseases of the respiratory system -- the lungs and other organs that help you breathe. Pulmonologists may use a variety of diagnostic tools, including chest X-rays, CT scans, pulmonary function tests, and bronchoscopy, to diagnose and treat respiratory conditions. They may also prescribe medications, such as inhalers or antibiotics, and recommend lifestyle changes, such as quitting smoking or losing weight, to manage or prevent respiratory problems. In some cases, pulmonologists may also perform surgical procedures, such as lung biopsies or lung transplant surgeries. They are known to treat diseases like Asthma, Chronic, Pneumonia, Tuberculosis, Pulmonary fibrosis, Lung cancer, Sleep apnea, and Occupational lung diseases - conditions caused by exposure to certain dust, chemicals, or other substances in the workplace. ",
  ),
  PageFile(4,
    name: 'OTC Medicine',
    iconImage: 'assets/otc.png',
    description:
    "Non-steroidal anti-inflammatory drugs (NSAIDs) are medicines that are widely used to relieve pain, reduce inflammation, and bring down a high temperature. They're often used to relieve symptoms of headaches, painful periods, sprains and strains, colds and flu, coronavirus (COVID-19), conditions such as arthritis that can cause long-term pain. The main types of NSAIDs include ibuprofen, naproxen, diclofenac, celecoxib, mefenamic acid, etoricoxib, indomethacin, aspirin for pain relief (low-dose aspirin is not normally considered to be an NSAID).",
  ),
  PageFile(5,
    name: 'Immediate Action',
    iconImage: 'assets/action.png',
    description:
    "Your Primary physician or general doctor can diagnose and treat a common disease or flu. Additionally a Primary physician can also provide advice on how to manage your symptoms and prevent the spread of the virus to others. If your symptoms are severe, or if you are at high risk for complications from the flu, your PCP may refer you to a specialist such as an infectious disease specialist or a pulmonologist. Additionally, if you experience symptoms such as difficulty breathing or chest pain, you should seek immediate medical attention by going to an emergency room or using SOS.",
  ),
  PageFile(6,
    name: 'Immediate Action',
    iconImage: 'assets/action.png',
    description:
    "Neurologists are doctors who diagnose and treat problems with the brain and nervous system. They don't do surgery. Your doctor might recommend that you see one if they think you have an illness that needs expert care. A neurologist has at least a college degree and 4 years of medical school plus a 1 year internship and 3 years of special training in neurology. Many also spend extra time learning about a specific field, like movement disorders or pain management. ",
  ),
  PageFile(7,
    name: 'Immediate Action',
    iconImage: 'assets/action.png',
    description:
    "Dentists are trained professionals who help care for the teeth and mouth. Regularly seeing a dentist can help you to maintain a good level of dental health, which may have a direct impact on your overall well-being. A dentist has many responsibilities, and one of the most important is promoting good dental hygiene. This helps to prevent complications in your mouth or other parts of the body. A dentist also diagnoses and treats problems of the gums, teeth, and mouth. Dentists use modern technology and equipment like X-ray machines, lasers, drills, brushes, scalpels, and other medical tools when performing dental procedures. They also wear protective equipment like gloves, masks, and safety glasses to prevent the spread of germs or bacteria.",
  ),
];

