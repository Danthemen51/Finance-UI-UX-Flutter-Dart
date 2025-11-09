import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/transaction.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel(
        title: 'Spotify Premium',
        amount: '- Rp 54.990',
        date: DateTime.now(),
        iconPath: 'assets/images/spotify.png',
      ),
      TransactionModel(
        title: 'Shopeepay Top Up',
        amount: '+ Rp 100.000',
        date: DateTime.now().subtract(Duration(days: 1)),
        iconPath: 'assets/images/shopee.png',
      ),
      TransactionModel(
        title: 'Transfer to Olly',
        amount: '- Rp 5.000.000',
        date: DateTime.now().subtract(Duration(days: 2)),
        iconPath: 'assets/images/olly.jpg',
      ),
      TransactionModel(
        title: 'Amazon Purchase',
        amount: '- Rp 350.000',
        date: DateTime.now().subtract(Duration(days: 3)),
        iconPath: 'assets/images/amazon.png',
      ),
    ];

    const bgGradientStart = Color(0xFF1F3350);
    const bgGradientEnd = Color(0xFF0B1828);
    const cardGradientStart = Color(0xFF233B57);
    const cardGradientEnd = Color(0xFF122235);
    const accentMint = Color(0xFF41E2B6);

    return Scaffold(
      backgroundColor: bgGradientStart,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [bgGradientStart, bgGradientEnd],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row: profile pill + actions
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 16,
                            backgroundImage: AssetImage(
                              'assets/images/dandi.jpg',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Dandi Mulyana',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white70,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.search, color: Colors.white70),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.notifications_none,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                // Total Balance card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color.fromARGB(255, 35, 59, 87), Color.fromARGB(255, 18, 34, 53)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.35),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Balance',
                        style: GoogleFonts.poppins(color: Colors.white70),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\Rp 230.900.500',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Income',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '\Rp 121.768.651',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 36,
                            color: Colors.white12,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Outcome',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '\Rp 54.890.000',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // My Cards section
                const SizedBox(height: 18),
                Text(
                  'My Cards',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),

                SizedBox(
                  height: 200, // tinggi area kartu
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      AtmCard(
                        bankName: 'Bank BNI',
                        balance: 'Rp 150.000.000',
                        cardNumber: '**** **** **** 1234',
                        gradientStart: Color(0xFF4158D0),
                        gradientEnd: Color(0xFFC850C0),
                      ),
                      SizedBox(width: 16),
                      AtmCard(
                        bankName: 'Bank Indonesia',
                        balance: 'Rp 80.000.000',
                        cardNumber: '**** **** **** 5678',
                        gradientStart: Color(0xFF0093E9),
                        gradientEnd: Color(0xFF80D0C7),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // Action pills
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _ActionPill(
                      icon: Icons.send,
                      label: 'Send',
                      color: const Color(0xFF5E8BFF),
                    ),
                    _ActionPill(
                      icon: Icons.call_received,
                      label: 'Receive',
                      color: const Color(0xFF8A6BFF),
                    ),
                    _ActionPill(
                      icon: Icons.swap_horiz,
                      label: 'Convert',
                      color: const Color(0xFFFF6B8A),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                // Quick Money Transfer
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Quick Money Transfer',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      'See More',
                      style: GoogleFonts.poppins(color: Colors.white70),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 56,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.add, color: Colors.white70),
                      ),
                      const SizedBox(width: 10),
                      _SmallAvatar(
                        name: 'Alex',
                        image: 'assets/images/justin.jpg',
                      ),
                      const SizedBox(width: 10),
                      _SmallAvatar(
                        name: 'Ben',
                        image: 'assets/images/olly.jpg',
                      ),
                      const SizedBox(width: 10),
                      _SmallAvatar(
                        name: 'Cara',
                        image: 'assets/images/neng.jpg',
                      ),
                      const SizedBox(width: 10),
                      _SmallAvatar(
                        name: 'Dana',
                        image: 'assets/images/molly.jpg',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // Recent Transactions header
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Recent Transaction',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      'See More',
                      style: GoogleFonts.poppins(color: Colors.white70),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // ✅ FIXED Transaction List (tanpa Expanded)
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: transactions.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) =>
                      TransactionItem(transaction: transactions[index]),
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: accentMint,
        child: const Icon(Icons.qr_code_2, color: Colors.black87),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(18, 0, 18, 18),
        height: 66,
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _NavIcon(icon: Icons.home, active: true),
            _NavIcon(icon: Icons.credit_card),
            SizedBox(width: 48),
            _NavIcon(icon: Icons.show_chart),
            _NavIcon(icon: Icons.more_horiz),
          ],
        ),
      ),
    );
  }
}

// Helper widgets tetap sama seperti punyamu
class _ActionPill extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _ActionPill({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 78,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 26),
            const SizedBox(height: 6),
            Text(
              label,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SmallAvatar extends StatelessWidget {
  final String name;
  final String image;
  const _SmallAvatar({required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: CircleAvatar(radius: 18, backgroundImage: AssetImage(image)),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final bool active;
  const _NavIcon({required this.icon, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: active ? Colors.white : Colors.white70),
        const SizedBox(height: 4),
        Container(
          height: 4,
          width: 24,
          decoration: const BoxDecoration(color: Colors.transparent),
        ),
      ],
    );
  }
}
