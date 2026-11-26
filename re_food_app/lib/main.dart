import 'package:flutter/material.dart';

void main() => runApp(const ReFoodApp());

const Color green = Color(0xFF20B879);
const Color darkGreen = Color(0xFF087A50);
const Color paleGreen = Color(0xFFEAF8F0);
const Color ink = Color(0xFF17352A);
const Color muted = Color(0xFF7C8B83);
const Color canvas = Color(0xFFF8FAF8);

class ReFoodApp extends StatelessWidget {
  const ReFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Re-Food',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: canvas,
        colorScheme: ColorScheme.fromSeed(seedColor: green),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: canvas,
          foregroundColor: ink,
          elevation: 0,
          centerTitle: false,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFE5ECE7)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFE5ECE7)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: green, width: 1.5),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class Food {
  final String name, seller, price, distance, image, description, category;
  const Food(this.name, this.seller, this.price, this.distance, this.image,
      this.description, this.category);
}

const foods = [
  Food(
      'Makan Siap Saji',
      'Dapur Berbagi',
      'Rp15.000',
      '1,2 km',
      'assets/images/meal.png',
      'Menu makan siang rumahan yang disiapkan hari ini. Dikemas dengan baik dan masih layak konsumsi.',
      'Siap saji'),
  Food(
      'Sayuran Segar',
      'Kebun Lokal',
      'Rp10.000',
      '2 km',
      'assets/images/vegetables.png',
      'Sayuran segar pilihan yang masih dalam kondisi baik dan siap diolah.',
      'Sayur'),
  Food(
      'Roti Gandum',
      'Roti Pagi',
      'Rp8.000',
      '800 m',
      'assets/images/bread.png',
      'Roti gandum yang masih layak dikonsumsi. Cocok untuk sarapan.',
      'Roti'),
  Food(
      'Buah Potong',
      'Fresh Corner',
      'Rp10.000',
      '1,5 km',
      'assets/images/fruit.png',
      'Aneka buah segar yang sudah dipotong dan dikemas dengan bersih.',
      'Buah'),
];

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted)
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => const OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFF082B4A),
        body: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset('assets/images/refood_logo.png',
              width: 150,
              height: 150,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.favorite, color: green, size: 110)),
          const SizedBox(height: 18),
          const Text('Re-Food',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Save food. Share happiness.',
              style: TextStyle(color: Colors.white70, fontSize: 14)),
        ])),
      );
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Spacer(),
            ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Image.asset('assets/images/onboard.png',
                    height: 340, width: double.infinity, fit: BoxFit.cover)),
            const SizedBox(height: 30),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                    color: paleGreen, borderRadius: BorderRadius.circular(30)),
                child: const Text('GERAKAN PANGAN BERKELANJUTAN',
                    style: TextStyle(
                        color: darkGreen,
                        fontSize: 10,
                        fontWeight: FontWeight.bold))),
            const SizedBox(height: 18),
            const Text('Makanan berlebih, manfaat lebih besar.',
                style: TextStyle(
                    fontSize: 27,
                    height: 1.2,
                    fontWeight: FontWeight.bold,
                    color: ink)),
            const SizedBox(height: 12),
            const Text(
                'Temukan makanan layak konsumsi dan hubungkan dengan orang yang membutuhkannya.',
                style: TextStyle(color: muted, height: 1.5, fontSize: 14)),
            const Spacer(),
            PrimaryButton(
                label: 'Mulai sekarang',
                onPressed: () => go(context, const RegisterScreen())),
            const SizedBox(height: 14),
            Center(
                child: TextButton(
                    onPressed: () => go(context, const LoginScreen()),
                    child: const Text('Sudah punya akun? Masuk',
                        style: TextStyle(color: darkGreen)))),
          ]),
        )),
      );
}

void go(BuildContext context, Widget page) =>
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const PrimaryButton(
      {super.key, required this.label, required this.onPressed});
  @override
  Widget build(BuildContext context) => SizedBox(
      width: double.infinity,
      height: 52,
      child: FilledButton(
          style: FilledButton.styleFrom(
              backgroundColor: green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          onPressed: onPressed,
          child: Text(label,
              style: const TextStyle(fontWeight: FontWeight.bold))));
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController(), password = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AuthScaffold(
        title: 'Selamat datang kembali',
        subtitle: 'Masuk untuk melanjutkan kebaikan hari ini.',
        fields: [
          const FieldLabel('Email'),
          TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: 'nama@email.com',
                  prefixIcon: Icon(Icons.mail_outline))),
          const SizedBox(height: 18),
          const FieldLabel('Kata sandi'),
          TextField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: 'Masukkan kata sandi',
                  prefixIcon: Icon(Icons.lock_outline))),
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Fitur pemulihan kata sandi belum terhubung.'))),
                  child: const Text('Lupa kata sandi?',
                      style: TextStyle(color: darkGreen)))),
          PrimaryButton(
              label: 'Masuk',
              onPressed: () {
                if (email.text.trim().isEmpty || password.text.isEmpty) {
                  showMsg(context, 'Isi email dan kata sandi terlebih dahulu.');
                  return;
                }
                go(context, const MainShell());
              }),
          const SizedBox(height: 24),
          const Center(
              child: Text('atau masuk dengan', style: TextStyle(color: muted))),
          const SizedBox(height: 14),
          OutlinedButton.icon(
              onPressed: () =>
                  showMsg(context, 'Login Google belum dikonfigurasi.'),
              icon: const Icon(Icons.g_mobiledata, size: 28),
              label: const Text('Lanjutkan dengan Google'),
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50))),
          const SizedBox(height: 14),
          Center(
              child: TextButton(
                  onPressed: () => go(context, const RegisterScreen()),
                  child: const Text('Belum punya akun? Daftar',
                      style: TextStyle(color: darkGreen)))),
        ],
      );
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final name = TextEditingController(),
      email = TextEditingController(),
      phone = TextEditingController(),
      password = TextEditingController();
  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AuthScaffold(
        title: 'Buat akun Re-Food',
        subtitle: 'Mulai berbagi makanan dan mengurangi limbah pangan.',
        fields: [
          const FieldLabel('Nama lengkap'),
          TextField(
              controller: name,
              decoration: const InputDecoration(hintText: 'Nama kamu')),
          const SizedBox(height: 14),
          const FieldLabel('Email'),
          TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: 'nama@email.com')),
          const SizedBox(height: 14),
          const FieldLabel('Nomor telepon'),
          TextField(
              controller: phone,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(hintText: '+62')),
          const SizedBox(height: 14),
          const FieldLabel('Kata sandi'),
          TextField(
              controller: password,
              obscureText: true,
              decoration:
                  const InputDecoration(hintText: 'Minimal 8 karakter')),
          const SizedBox(height: 24),
          PrimaryButton(
              label: 'Buat akun',
              onPressed: () {
                if ([name.text, email.text, phone.text, password.text]
                    .any((v) => v.trim().isEmpty)) {
                  showMsg(context, 'Lengkapi semua data terlebih dahulu.');
                  return;
                }
                if (password.text.length < 8) {
                  showMsg(context, 'Kata sandi minimal 8 karakter.');
                  return;
                }
                go(context, const MainShell());
              }),
          const SizedBox(height: 14),
          Center(
              child: TextButton(
                  onPressed: () => go(context, const LoginScreen()),
                  child: const Text('Sudah memiliki akun? Masuk',
                      style: TextStyle(color: darkGreen)))),
        ],
      );
}

class AuthScaffold extends StatelessWidget {
  final String title, subtitle;
  final List<Widget> fields;
  const AuthScaffold(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.fields});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context))),
        body: SafeArea(
            child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 28),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Image.asset('assets/images/refood_logo.png',
                  width: 48,
                  height: 48,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.favorite, color: green, size: 42)),
              const SizedBox(width: 10),
              const Text('Re-Food',
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold, color: ink)),
            ]),
            const SizedBox(height: 35),
            Text(title,
                style: const TextStyle(
                    fontSize: 26, fontWeight: FontWeight.bold, color: ink)),
            const SizedBox(height: 8),
            Text(subtitle, style: const TextStyle(color: muted)),
            const SizedBox(height: 32),
            ...fields,
          ]),
        )),
      );
}

class FieldLabel extends StatelessWidget {
  final String text;
  const FieldLabel(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text,
          style: const TextStyle(fontWeight: FontWeight.w600, color: ink)));
}

void showMsg(BuildContext context, String msg) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int index = 0;
  final pages = const [
    HomeScreen(),
    ExploreScreen(),
    DonateScreen(),
    ActivityScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(index: index, children: pages),
        bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (v) => setState(() => index = v),
          backgroundColor: Colors.white,
          indicatorColor: paleGreen,
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Beranda'),
            NavigationDestination(icon: Icon(Icons.search), label: 'Jelajah'),
            NavigationDestination(
                icon: Icon(Icons.add_circle_outline), label: 'Donasi'),
            NavigationDestination(
                icon: Icon(Icons.favorite_border), label: 'Aktivitas'),
            NavigationDestination(
                icon: Icon(Icons.person_outline), label: 'Profil'),
          ],
        ),
      );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => SafeArea(
        child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
            children: [
              Row(children: [
                Image.asset('assets/images/refood_logo.png',
                    width: 42,
                    height: 42,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.favorite, color: green, size: 36)),
                const SizedBox(width: 8),
                const Text('Re-Food',
                    style: TextStyle(
                        fontSize: 21, fontWeight: FontWeight.bold, color: ink)),
                const Spacer(),
                const Icon(Icons.location_on_outlined, color: green, size: 18),
                const Text('Jakarta Selatan',
                    style: TextStyle(fontSize: 12, color: muted)),
              ]),
              const SizedBox(height: 30),
              const Text('Halo, Sahabat!',
                  style: TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold, color: ink)),
              const SizedBox(height: 7),
              const Text('Ada makanan baik yang menunggumu hari ini.',
                  style: TextStyle(color: muted)),
              const SizedBox(height: 22),
              Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          colors: [Color(0xFF0B8055), Color(0xFF35C98A)])),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Selamatkan makanan.\nBagikan kebaikan.',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        const SizedBox(height: 14),
                        TextButton(
                            onPressed: () => showMsg(context,
                                'Re-Food menghubungkan makanan berlebih dengan orang yang membutuhkan.'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: darkGreen),
                            child: const Text('LIHAT CARA KERJA')),
                      ])),
              const SizedBox(height: 26),
              const SectionTitle('Temukan makanan'),
              const SizedBox(height: 12),
              GestureDetector(
                  onTap: () => go(context, const ExploreScreen()),
                  child: const SearchBox(hint: 'Cari makanan di sekitarmu')),
              const SizedBox(height: 24),
              const SectionTitle('Kategori'),
              const SizedBox(height: 12),
              Row(children: const [
                CategoryTile(icon: '🍱', label: 'Siap Saji'),
                CategoryTile(icon: '🥦', label: 'Sayuran'),
                CategoryTile(icon: '🍎', label: 'Buah'),
                CategoryTile(icon: '🥖', label: 'Roti'),
              ]),
              const SizedBox(height: 24),
              const SectionTitle('Pilihan untukmu'),
              const SizedBox(height: 12),
              SizedBox(
                  height: 220,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: foods.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, i) => SizedBox(
                          width: 175, child: FoodCard(food: foods[i])))),
            ]),
      );
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title, {super.key});
  @override
  Widget build(BuildContext context) => Text(title,
      style: const TextStyle(
          fontSize: 19, fontWeight: FontWeight.bold, color: ink));
}

class SearchBox extends StatelessWidget {
  final String hint;
  const SearchBox({super.key, required this.hint});
  @override
  Widget build(BuildContext context) => Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE5ECE7))),
      child: Row(children: [
        const Icon(Icons.search, color: muted),
        const SizedBox(width: 10),
        Text(hint, style: const TextStyle(color: muted))
      ]));
}

class CategoryTile extends StatelessWidget {
  final String icon, label;
  const CategoryTile({super.key, required this.icon, required this.label});
  @override
  Widget build(BuildContext context) => Expanded(
      child: Container(
          margin: const EdgeInsets.only(right: 7),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(14)),
          child: Column(children: [
            Text(icon, style: const TextStyle(fontSize: 23)),
            const SizedBox(height: 5),
            Text(label, style: const TextStyle(fontSize: 10, color: ink))
          ])));
}

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});
  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String category = 'Semua';
  String query = '';
  final categories = const ['Semua', 'Siap saji', 'Buah', 'Sayur', 'Roti'];
  @override
  Widget build(BuildContext context) {
    final filtered = foods
        .where((f) =>
            (category == 'Semua' ||
                f.category.toLowerCase() == category.toLowerCase()) &&
            (f.name.toLowerCase().contains(query.toLowerCase()) ||
                f.seller.toLowerCase().contains(query.toLowerCase())))
        .toList();
    return SafeArea(
        child: ListView(padding: const EdgeInsets.all(20), children: [
      const SectionTitle('Jelajahi makanan'),
      const SizedBox(height: 7),
      const Text('Temukan makanan baik di dekatmu.',
          style: TextStyle(color: muted)),
      const SizedBox(height: 20),
      TextField(
          onChanged: (v) => setState(() => query = v),
          decoration: const InputDecoration(
              hintText: 'Cari nama makanan atau lokasi',
              prefixIcon: Icon(Icons.search))),
      const SizedBox(height: 22),
      const SectionTitle('Kategori'),
      const SizedBox(height: 12),
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: categories
                  .map((c) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                          label: Text(c),
                          selected: category == c,
                          onSelected: (_) => setState(() => category = c),
                          selectedColor: paleGreen)))
                  .toList())),
      const SizedBox(height: 24),
      const SectionTitle('Tersedia di sekitarmu'),
      const SizedBox(height: 12),
      GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filtered.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: .78),
          itemBuilder: (context, i) => FoodCard(food: filtered[i])),
      if (filtered.isEmpty)
        const Padding(
            padding: EdgeInsets.all(30),
            child: Center(
                child: Text('Makanan tidak ditemukan.',
                    style: TextStyle(color: muted)))),
    ]));
  }
}

class FoodCard extends StatelessWidget {
  final Food food;
  const FoodCard({super.key, required this.food});
  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(17),
        onTap: () => go(context, FoodDetailScreen(food: food)),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
                border: Border.all(color: const Color(0xFFEAF0EC))),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(17)),
                      child: Image.asset(food.image,
                          width: double.infinity, fit: BoxFit.cover))),
              Padding(
                  padding: const EdgeInsets.fromLTRB(11, 9, 11, 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(food.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, color: ink)),
                        const SizedBox(height: 4),
                        Text('${food.seller} · ${food.distance}',
                            maxLines: 1,
                            style: const TextStyle(fontSize: 10, color: muted)),
                        const SizedBox(height: 5),
                        Text(food.price,
                            style: const TextStyle(
                                color: darkGreen, fontWeight: FontWeight.bold)),
                      ])),
            ])),
      );
}

class FoodDetailScreen extends StatelessWidget {
  final Food food;
  const FoodDetailScreen({super.key, required this.food});
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(children: [
          Stack(children: [
            Image.asset(food.image,
                height: 310, width: double.infinity, fit: BoxFit.cover),
            Positioned(
                top: 45,
                left: 18,
                child: CircleIcon(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.pop(context))),
            Positioned(
                top: 45,
                right: 18,
                child: CircleIcon(
                    icon: Icons.favorite_border,
                    onTap: () => showMsg(context, 'Ditambahkan ke favorit.'))),
          ]),
          Expanded(
              child: ListView(padding: const EdgeInsets.all(24), children: [
            Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                    color: paleGreen, borderRadius: BorderRadius.circular(30)),
                child: const Text('MAKANAN TERSEDIA',
                    style: TextStyle(
                        color: darkGreen,
                        fontSize: 10,
                        fontWeight: FontWeight.bold))),
            const SizedBox(height: 18),
            Text(food.name,
                style: const TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold, color: ink)),
            const SizedBox(height: 8),
            Text('${food.seller} · ${food.distance} dari lokasimu',
                style: const TextStyle(color: muted)),
            const SizedBox(height: 16),
            Text(food.price,
                style: const TextStyle(
                    fontSize: 23,
                    color: darkGreen,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 28),
            const SectionTitle('Deskripsi'),
            const SizedBox(height: 9),
            Text(food.description,
                style: const TextStyle(color: muted, height: 1.5)),
            const SizedBox(height: 28),
            const SectionTitle('Informasi makanan'),
            const SizedBox(height: 10),
            const InfoRow(
                icon: Icons.access_time, text: 'Pengambilan 11.00–14.00'),
            const InfoRow(
                icon: Icons.verified_outlined, text: 'Kondisi siap konsumsi'),
            const InfoRow(
                icon: Icons.inventory_2_outlined, text: 'Porsi 5 paket'),
          ])),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: PrimaryButton(
                  label: 'Pesan makanan · ${food.price}',
                  onPressed: () => showMsg(context,
                      'Pesanan dicatat sebagai simulasi. Backend belum terhubung.'))),
        ]),
      );
}

class CircleIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const CircleIcon({super.key, required this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) => Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: IconButton(onPressed: onTap, icon: Icon(icon, color: ink)));
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const InfoRow({super.key, required this.icon, required this.text});
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(children: [
        Icon(icon, size: 19, color: green),
        const SizedBox(width: 12),
        Text(text, style: const TextStyle(color: muted))
      ]));
}

class DonateScreen extends StatefulWidget {
  const DonateScreen({super.key});
  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  final name = TextEditingController(),
      portions = TextEditingController(),
      location = TextEditingController(),
      notes = TextEditingController();
  DateTime? expiry;
  @override
  void dispose() {
    name.dispose();
    portions.dispose();
    location.dispose();
    notes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
          child: ListView(padding: const EdgeInsets.all(20), children: [
        const SectionTitle('Donasikan makanan'),
        const SizedBox(height: 7),
        const Text('Bagikan makanan berlebih yang masih layak konsumsi.',
            style: TextStyle(color: muted)),
        const SizedBox(height: 22),
        Container(
            height: 112,
            decoration: BoxDecoration(
                color: paleGreen,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFBFEBD4))),
            child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_a_photo_outlined, color: darkGreen, size: 30),
                  SizedBox(height: 8),
                  Text('Unggah foto makanan',
                      style: TextStyle(
                          color: darkGreen, fontWeight: FontWeight.w600)),
                ])),
        const SizedBox(height: 20),
        const FieldLabel('Nama makanan'),
        TextField(
            controller: name,
            decoration: const InputDecoration(hintText: 'Contoh: Nasi kotak')),
        const SizedBox(height: 16),
        const FieldLabel('Jumlah porsi'),
        TextField(
            controller: portions,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Contoh: 10 porsi')),
        const SizedBox(height: 16),
        const FieldLabel('Tanggal kedaluwarsa'),
        OutlinedButton.icon(
            onPressed: () async {
              final d = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                  initialDate: DateTime.now());
              if (d != null) setState(() => expiry = d);
            },
            icon: const Icon(Icons.calendar_today),
            label: Text(expiry == null
                ? 'Pilih tanggal'
                : '${expiry!.day}/${expiry!.month}/${expiry!.year}')),
        const SizedBox(height: 16),
        const FieldLabel('Lokasi pengambilan'),
        TextField(
            controller: location,
            decoration: const InputDecoration(hintText: 'Masukkan alamat')),
        const SizedBox(height: 16),
        const FieldLabel('Catatan tambahan'),
        TextField(
            controller: notes,
            maxLines: 3,
            decoration: const InputDecoration(
                hintText: 'Informasi tambahan (opsional)')),
        const SizedBox(height: 24),
        PrimaryButton(
            label: 'Publikasikan donasi',
            onPressed: () {
              if (name.text.trim().isEmpty ||
                  portions.text.trim().isEmpty ||
                  location.text.trim().isEmpty ||
                  expiry == null) {
                showMsg(context, 'Lengkapi nama, porsi, tanggal, dan lokasi.');
                return;
              }
              showMsg(context, 'Data donasi berhasil divalidasi (simulasi).');
              name.clear();
              portions.clear();
              location.clear();
              notes.clear();
              setState(() => expiry = null);
            }),
      ]));
}

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});
  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  int tab = 0;
  @override
  Widget build(BuildContext context) => SafeArea(
          child: ListView(padding: const EdgeInsets.all(20), children: [
        const SectionTitle('Aktivitas'),
        const SizedBox(height: 7),
        const Text('Pantau pesanan dan kontribusimu.',
            style: TextStyle(color: muted)),
        const SizedBox(height: 20),
        SegmentedButton<int>(segments: const [
          ButtonSegment(value: 0, label: Text('PESANAN')),
          ButtonSegment(value: 1, label: Text('DONASI')),
        ], selected: {
          tab
        }, onSelectionChanged: (v) => setState(() => tab = v.first)),
        const SizedBox(height: 18),
        if (tab == 0) ...[
          const ActivityCard(
              image: 'assets/images/meal.png',
              title: 'Makan Siap Saji',
              subtitle: 'Dapur Berbagi · Hari ini',
              status: 'Menunggu pengambilan'),
          const ActivityCard(
              image: 'assets/images/vegetables.png',
              title: 'Sayuran',
              subtitle: 'Kebun Lokal · Kemarin',
              status: 'Selesai'),
          const ActivityCard(
              image: 'assets/images/bread.png',
              title: 'Roti Gandum',
              subtitle: 'Roti Pagi · 10 Nov',
              status: 'Selesai'),
        ] else
          const ActivityCard(
              image: 'assets/images/fruit.png',
              title: 'Donasi buah segar',
              subtitle: 'Donasi kamu · Hari ini',
              status: 'Menunggu penerima'),
      ]));
}

class ActivityCard extends StatelessWidget {
  final String image, title, subtitle, status;
  const ActivityCard(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.status});
  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.only(bottom: 13),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFEAF0EC))),
      child: Row(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child:
                Image.asset(image, width: 68, height: 68, fit: BoxFit.cover)),
        const SizedBox(width: 13),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title,
              style: const TextStyle(fontWeight: FontWeight.bold, color: ink)),
          const SizedBox(height: 5),
          Text(subtitle, style: const TextStyle(fontSize: 11, color: muted)),
          const SizedBox(height: 8),
          Text(status,
              style: const TextStyle(
                  fontSize: 11, color: darkGreen, fontWeight: FontWeight.w600)),
        ])),
      ]));
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => SafeArea(
          child: ListView(padding: const EdgeInsets.all(20), children: [
        const SectionTitle('Profil saya'),
        const SizedBox(height: 7),
        const Text('Kelola informasi akun Re-Food.',
            style: TextStyle(color: muted)),
        const SizedBox(height: 22),
        Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFEAF0EC))),
            child: Row(children: [
              CircleAvatar(
                  radius: 32,
                  backgroundColor: paleGreen,
                  child: const Text('R',
                      style: TextStyle(
                          fontSize: 28,
                          color: darkGreen,
                          fontWeight: FontWeight.bold))),
              const SizedBox(width: 15),
              const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rio Ferdinand',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ink,
                            fontSize: 16)),
                    SizedBox(height: 5),
                    Text('rio@email.com',
                        style: TextStyle(color: muted, fontSize: 12)),
                    SizedBox(height: 8),
                    Text('AKUN AKTIF',
                        style: TextStyle(
                            color: darkGreen,
                            fontSize: 10,
                            fontWeight: FontWeight.bold)),
                  ]),
            ])),
        const SizedBox(height: 20),
        const ProfileOption(icon: Icons.person_outline, label: 'Data pribadi'),
        const ProfileOption(
            icon: Icons.receipt_long_outlined, label: 'Riwayat pesanan'),
        const ProfileOption(icon: Icons.favorite_border, label: 'Donasi saya'),
        const ProfileOption(
            icon: Icons.location_on_outlined, label: 'Alamat tersimpan'),
        const ProfileOption(icon: Icons.settings_outlined, label: 'Pengaturan'),
        const ProfileOption(icon: Icons.help_outline, label: 'Pusat bantuan'),
        const SizedBox(height: 14),
        OutlinedButton.icon(
            onPressed: () => showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: const Text('Keluar dari akun?'),
                      content: const Text(
                          'Ini hanya contoh tampilan konfirmasi keluar.'),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Batal')),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const LoginScreen()),
                                  (_) => false);
                            },
                            child: const Text('Keluar'))
                      ],
                    )),
            icon: const Icon(Icons.logout),
            label: const Text('Keluar')),
      ]));
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String label;
  const ProfileOption({super.key, required this.icon, required this.label});
  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.only(bottom: 9),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: ListTile(
          leading: Icon(icon, color: darkGreen),
          title: Text(label,
              style: const TextStyle(color: ink, fontWeight: FontWeight.w500)),
          trailing: const Icon(Icons.chevron_right, color: muted),
          onTap: () => showMsg(context, 'Halaman $label belum dibuat.')));
}
