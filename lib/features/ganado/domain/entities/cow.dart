// Este es el "ADN" de tu vaca. La estructura que la IA leerá en el futuro.
class Cow {
  final String id; // ID único interno (UUID)
  final String areteNumber; // El número visual (ej: 405)
  final String? name;
  final String breed; // Raza
  final DateTime birthDate; // ¡CRÍTICO! Para calcular edad exacta
  final String gender; // Macho/Hembra

  // Reproducción (La competencia lo cobra, tú lo incluyes en la base)
  final String reproductiveStatus; // 'Vacia', 'Preñada', 'Inseminada'
  final DateTime? lastCalvingDate; // Último parto
  final DateTime? conceptionDate; // Fecha de concepción (para calcular parto)

  // Genealogía (Para evitar consanguinidad)
  final String? motherId;
  final String? fatherId;

  Cow({
    required this.id,
    required this.areteNumber,
    this.name,
    required this.breed,
    required this.birthDate,
    required this.gender,
    this.reproductiveStatus = 'Vacia',
    this.lastCalvingDate,
    this.conceptionDate,
    this.motherId,
    this.fatherId,
  });

  // --- TU VENTAJA: CÁLCULOS AUTOMÁTICOS ---
  // La competencia te hace mirar una tabla, tu app te lo dice al instante.

  // 1. Edad exacta
  int get ageInMonths {
    final now = DateTime.now();
    return (now.difference(birthDate).inDays / 30).floor();
  }

  // 2. Fecha Probable de Parto (Automática)
  // Si tiene fecha de concepción, sumamos 283 días (promedio bovino)
  DateTime? get probableCalvingDate {
    if (conceptionDate == null) return null;
    return conceptionDate!.add(const Duration(days: 283));
  }

  // 3. Fecha de Secado (Automática)
  // Se deben secar 60 días antes del parto
  DateTime? get dryOffDate {
    if (probableCalvingDate == null) return null;
    return probableCalvingDate!.subtract(const Duration(days: 60));
  }
}
