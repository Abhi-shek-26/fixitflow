import '../../models/category_model.dart';
import '../../models/service_model.dart';

class ServiceRepository {
  Future<List<CategoryModel>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 700));

    return const [
      CategoryModel(
        id: 'electrician',
        name: 'Electrician',
        icon: '⚡',
      ),
      CategoryModel(
        id: 'plumber',
        name: 'Plumbing',
        icon: '🔧',
      ),
      CategoryModel(
        id: 'ac_repair',
        name: 'AC Repair',
        icon: '❄️',
      ),
      CategoryModel(
        id: 'cleaning',
        name: 'Cleaning',
        icon: '🧹',
      ),
      CategoryModel(
        id: 'carpenter',
        name: 'Carpenter',
        icon: '🪚',
      ),
      CategoryModel(
        id: 'painting',
        name: 'Painting',
        icon: '🎨',
      ),
      CategoryModel(
        id: 'appliance_repair',
        name: 'Appliance Repair',
        icon: '🔌',
      ),
      CategoryModel(
        id: 'pest_control',
        name: 'Pest Control',
        icon: '🐜',
      ),
    ];
  }

  Future<List<ServiceModel>> getServices() async {
    await Future.delayed(const Duration(milliseconds: 900));

    return const [
      ServiceModel(
        id: 'electrician_1',
        categoryId: 'electrician',
        name: 'Home Electrical Repair',
        image: 'https://images.unsplash.com/photo-1621905252507-b35492cc74b4',
        price: 499,
        rating: 4.8,
        reviewCount: 124,
        duration: '1 - 2 hours',
        description:
        'Professional electrical repair service for switches, sockets, wiring, lights and other common household electrical issues.',
      ),
      ServiceModel(
        id: 'electrician_2',
        categoryId: 'electrician',
        name: 'Fan Installation',
        image: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64',
        price: 349,
        rating: 4.7,
        reviewCount: 89,
        duration: '1 hour',
        description:
        'Safe and professional ceiling or wall fan installation by an experienced technician.',
      ),
      ServiceModel(
        id: 'electrician_3',
        categoryId: 'electrician',
        name: 'Light Installation',
        image: 'https://images.unsplash.com/photo-1565814329452-e1efa11c5b89',
        price: 299,
        rating: 4.8,
        reviewCount: 76,
        duration: '1 hour',
        description:
        'Professional installation of ceiling lights, wall lights, LED lights and decorative lighting.',
      ),
      ServiceModel(
        id: 'electrician_4',
        categoryId: 'electrician',
        name: 'Switch & Socket Repair',
        image: 'https://images.unsplash.com/photo-1621905251918-48416bd8575a',
        price: 249,
        rating: 4.6,
        reviewCount: 68,
        duration: '1 hour',
        description:
        'Repair and replacement of damaged switches, sockets and electrical connections.',
      ),
      ServiceModel(
        id: 'electrician_5',
        categoryId: 'electrician',
        name: 'Wiring Repair',
        image: 'https://images.unsplash.com/photo-1558008258-3256797b43f3',
        price: 599,
        rating: 4.7,
        reviewCount: 91,
        duration: '2 - 3 hours',
        description:
        'Professional inspection and repair of damaged or faulty household electrical wiring.',
      ),
      ServiceModel(
        id: 'electrician_6',
        categoryId: 'electrician',
        name: 'MCB Repair & Installation',
        image: 'https://images.unsplash.com/photo-1621905251189-08b45d6a269e',
        price: 449,
        rating: 4.8,
        reviewCount: 57,
        duration: '1 - 2 hours',
        description:
        'MCB inspection, replacement and installation for improved electrical safety at home.',
      ),
      ServiceModel(
        id: 'electrician_7',
        categoryId: 'electrician',
        name: 'Inverter Installation',
        image: 'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e',
        price: 799,
        rating: 4.7,
        reviewCount: 45,
        duration: '2 hours',
        description:
        'Professional home inverter installation with proper wiring and system testing.',
      ),

      ServiceModel(
        id: 'plumber_1',
        categoryId: 'plumber',
        name: 'Bathroom Plumbing',
        image: 'https://images.unsplash.com/photo-1585704032915-c3400ca199e7',
        price: 399,
        rating: 4.6,
        reviewCount: 96,
        duration: '1 - 2 hours',
        description:
        'Complete bathroom plumbing assistance including leakage repair, pipe replacement and fixture installation.',
      ),
      ServiceModel(
        id: 'plumber_2',
        categoryId: 'plumber',
        name: 'Tap & Sink Repair',
        image: 'https://images.unsplash.com/photo-1607472586893-edb57bdc0e39',
        price: 299,
        rating: 4.7,
        reviewCount: 73,
        duration: '1 hour',
        description:
        'Quick repair and replacement service for leaking taps, sinks and related plumbing fixtures.',
      ),
      ServiceModel(
        id: 'plumber_3',
        categoryId: 'plumber',
        name: 'Pipe Leakage Repair',
        image: 'https://images.unsplash.com/photo-1600566753190-17f0baa2a6c3',
        price: 349,
        rating: 4.7,
        reviewCount: 84,
        duration: '1 - 2 hours',
        description:
        'Professional detection and repair of leaking water pipes and plumbing connections.',
      ),
      ServiceModel(
        id: 'plumber_4',
        categoryId: 'plumber',
        name: 'Toilet Repair',
        image: 'https://images.unsplash.com/photo-1584622650111-993a426fbf0a',
        price: 399,
        rating: 4.6,
        reviewCount: 61,
        duration: '1 - 2 hours',
        description:
        'Toilet repair service for blockages, leaks, flushing problems and damaged fittings.',
      ),
      ServiceModel(
        id: 'plumber_5',
        categoryId: 'plumber',
        name: 'Water Tank Plumbing',
        image: 'https://images.unsplash.com/photo-1581094794329-c8112a89af12',
        price: 549,
        rating: 4.5,
        reviewCount: 42,
        duration: '2 hours',
        description:
        'Water tank pipe connection, leakage repair and plumbing maintenance service.',
      ),
      ServiceModel(
        id: 'plumber_6',
        categoryId: 'plumber',
        name: 'Drainage Cleaning',
        image: 'https://images.unsplash.com/photo-1584622781867-4a8a4b5c3b75',
        price: 449,
        rating: 4.7,
        reviewCount: 79,
        duration: '1 - 2 hours',
        description:
        'Professional cleaning and blockage removal for household drainage systems.',
      ),

      ServiceModel(
        id: 'ac_1',
        categoryId: 'ac_repair',
        name: 'AC Service & Cleaning',
        image: 'https://images.unsplash.com/photo-1631545806609-8c7b7c3f0a6f',
        price: 699,
        rating: 4.8,
        reviewCount: 156,
        duration: '1 - 2 hours',
        description:
        'Professional AC servicing that includes filter cleaning, inspection and basic maintenance.',
      ),
      ServiceModel(
        id: 'ac_2',
        categoryId: 'ac_repair',
        name: 'AC Installation',
        image: 'https://images.unsplash.com/photo-1581094794329-c8112a89af12',
        price: 1499,
        rating: 4.6,
        reviewCount: 64,
        duration: '2 - 3 hours',
        description:
        'Reliable split and window AC installation service with proper fitting and testing.',
      ),
      ServiceModel(
        id: 'ac_3',
        categoryId: 'ac_repair',
        name: 'AC Gas Filling',
        image: 'https://images.unsplash.com/photo-1621905252507-b35492cc74b4',
        price: 999,
        rating: 4.7,
        reviewCount: 92,
        duration: '1 - 2 hours',
        description:
        'AC gas charging service to improve cooling performance and restore proper operation.',
      ),
      ServiceModel(
        id: 'ac_4',
        categoryId: 'ac_repair',
        name: 'AC Repair',
        image: 'https://images.unsplash.com/photo-1631545806609-8c7b7c3f0a6f',
        price: 599,
        rating: 4.6,
        reviewCount: 113,
        duration: '1 - 2 hours',
        description:
        'Professional diagnosis and repair for common AC cooling, electrical and operational problems.',
      ),
      ServiceModel(
        id: 'ac_5',
        categoryId: 'ac_repair',
        name: 'AC Filter Cleaning',
        image: 'https://images.unsplash.com/photo-1581094794329-c8112a89af12',
        price: 399,
        rating: 4.8,
        reviewCount: 87,
        duration: '1 hour',
        description:
        'Deep cleaning of AC filters to maintain airflow and improve cooling performance.',
      ),

      ServiceModel(
        id: 'cleaning_1',
        categoryId: 'cleaning',
        name: 'Full Home Cleaning',
        image: 'https://images.unsplash.com/photo-1581578731548-c64695cc6952',
        price: 999,
        rating: 4.9,
        reviewCount: 212,
        duration: '3 - 4 hours',
        description:
        'Detailed home cleaning service covering bedrooms, living areas, kitchen and bathrooms.',
      ),
      ServiceModel(
        id: 'cleaning_2',
        categoryId: 'cleaning',
        name: 'Kitchen Cleaning',
        image: 'https://images.unsplash.com/photo-1556911220-e15b29be8c8f',
        price: 599,
        rating: 4.8,
        reviewCount: 108,
        duration: '2 hours',
        description:
        'Deep cleaning service for kitchen surfaces, cabinets, countertops and common areas.',
      ),
      ServiceModel(
        id: 'cleaning_3',
        categoryId: 'cleaning',
        name: 'Bathroom Cleaning',
        image: 'https://images.unsplash.com/photo-1584622650111-993a426fbf0a',
        price: 449,
        rating: 4.8,
        reviewCount: 134,
        duration: '1 - 2 hours',
        description:
        'Deep bathroom cleaning including floors, tiles, fixtures and sanitary areas.',
      ),
      ServiceModel(
        id: 'cleaning_4',
        categoryId: 'cleaning',
        name: 'Sofa Cleaning',
        image: 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc',
        price: 499,
        rating: 4.7,
        reviewCount: 88,
        duration: '1 - 2 hours',
        description:
        'Professional sofa and upholstery cleaning to remove dust, stains and dirt.',
      ),
      ServiceModel(
        id: 'cleaning_5',
        categoryId: 'cleaning',
        name: 'Carpet Cleaning',
        image: 'https://images.unsplash.com/photo-1600607687920-4e2a09cf159d',
        price: 399,
        rating: 4.6,
        reviewCount: 63,
        duration: '1 - 2 hours',
        description:
        'Deep carpet cleaning service to remove dust, stains and unwanted odors.',
      ),
      ServiceModel(
        id: 'cleaning_6',
        categoryId: 'cleaning',
        name: 'Floor Cleaning',
        image: 'https://images.unsplash.com/photo-1581578731548-c64695cc6952',
        price: 549,
        rating: 4.7,
        reviewCount: 71,
        duration: '2 hours',
        description:
        'Professional floor cleaning for tiles, marble and other household flooring.',
      ),

      ServiceModel(
        id: 'carpenter_1',
        categoryId: 'carpenter',
        name: 'Furniture Repair',
        image: 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc',
        price: 499,
        rating: 4.7,
        reviewCount: 92,
        duration: '1 - 2 hours',
        description:
        'Repair service for damaged tables, chairs, cabinets and other wooden furniture.',
      ),
      ServiceModel(
        id: 'carpenter_2',
        categoryId: 'carpenter',
        name: 'Door Repair',
        image: 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85',
        price: 399,
        rating: 4.6,
        reviewCount: 74,
        duration: '1 - 2 hours',
        description:
        'Professional repair for damaged doors, hinges, locks and wooden door frames.',
      ),
      ServiceModel(
        id: 'carpenter_3',
        categoryId: 'carpenter',
        name: 'Wardrobe Repair',
        image: 'https://images.unsplash.com/photo-1595428774223-ef52624120d2',
        price: 599,
        rating: 4.7,
        reviewCount: 58,
        duration: '2 hours',
        description:
        'Wardrobe repair and adjustment service for doors, hinges, shelves and fittings.',
      ),
      ServiceModel(
        id: 'carpenter_4',
        categoryId: 'carpenter',
        name: 'Bed Repair',
        image: 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85',
        price: 549,
        rating: 4.6,
        reviewCount: 49,
        duration: '1 - 2 hours',
        description:
        'Wooden and furniture bed repair service including joints, frames and fittings.',
      ),
      ServiceModel(
        id: 'carpenter_5',
        categoryId: 'carpenter',
        name: 'Furniture Assembly',
        image: 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc',
        price: 449,
        rating: 4.8,
        reviewCount: 83,
        duration: '1 - 2 hours',
        description:
        'Professional assembly service for tables, chairs, shelves and ready-to-assemble furniture.',
      ),

      ServiceModel(
        id: 'painting_1',
        categoryId: 'painting',
        name: 'Single Room Painting',
        image: 'https://images.unsplash.com/photo-1562259949-e8e7689d7828',
        price: 2499,
        rating: 4.8,
        reviewCount: 103,
        duration: '1 day',
        description:
        'Professional painting service for a single room with proper preparation and finishing.',
      ),
      ServiceModel(
        id: 'painting_2',
        categoryId: 'painting',
        name: 'Wall Touch Up',
        image: 'https://images.unsplash.com/photo-1562259949-e8e7689d7828',
        price: 799,
        rating: 4.7,
        reviewCount: 67,
        duration: '2 - 3 hours',
        description:
        'Quick wall touch-up service for scratches, stains, cracks and minor paint damage.',
      ),
      ServiceModel(
        id: 'painting_3',
        categoryId: 'painting',
        name: 'Full Home Painting',
        image: 'https://images.unsplash.com/photo-1562259949-e8e7689d7828',
        price: 8999,
        rating: 4.9,
        reviewCount: 86,
        duration: '3 - 5 days',
        description:
        'Complete interior home painting service with professional preparation and finishing.',
      ),
      ServiceModel(
        id: 'painting_4',
        categoryId: 'painting',
        name: 'Interior Painting',
        image: 'https://images.unsplash.com/photo-1562259949-e8e7689d7828',
        price: 4999,
        rating: 4.8,
        reviewCount: 72,
        duration: '2 - 3 days',
        description:
        'Interior wall and ceiling painting service for homes and apartments.',
      ),
      ServiceModel(
        id: 'painting_5',
        categoryId: 'painting',
        name: 'Door Painting',
        image: 'https://images.unsplash.com/photo-1513694203232-719a280e022f',
        price: 699,
        rating: 4.6,
        reviewCount: 51,
        duration: '3 - 4 hours',
        description:
        'Professional painting and finishing service for wooden and metal doors.',
      ),

      ServiceModel(
        id: 'appliance_1',
        categoryId: 'appliance_repair',
        name: 'Microwave Repair',
        image: 'https://images.unsplash.com/photo-1585659722983-3a675dabf23d',
        price: 399,
        rating: 4.6,
        reviewCount: 54,
        duration: '1 - 2 hours',
        description:
        'Professional microwave inspection and repair for common heating and electrical issues.',
      ),
      ServiceModel(
        id: 'appliance_2',
        categoryId: 'appliance_repair',
        name: 'Washing Machine Repair',
        image: 'https://images.unsplash.com/photo-1626806787461-102c1bfaaea1',
        price: 499,
        rating: 4.7,
        reviewCount: 118,
        duration: '1 - 2 hours',
        description:
        'Washing machine diagnosis and repair for drainage, spinning, water and electrical problems.',
      ),
      ServiceModel(
        id: 'appliance_3',
        categoryId: 'appliance_repair',
        name: 'Refrigerator Repair',
        image: 'https://images.unsplash.com/photo-1571175443880-49e1d25b2bc5',
        price: 599,
        rating: 4.7,
        reviewCount: 96,
        duration: '1 - 2 hours',
        description:
        'Professional refrigerator inspection and repair for cooling and electrical issues.',
      ),
      ServiceModel(
        id: 'appliance_4',
        categoryId: 'appliance_repair',
        name: 'TV Repair',
        image: 'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1',
        price: 499,
        rating: 4.5,
        reviewCount: 61,
        duration: '1 - 2 hours',
        description:
        'TV inspection and repair service for display, power and common hardware problems.',
      ),
      ServiceModel(
        id: 'appliance_5',
        categoryId: 'appliance_repair',
        name: 'Geyser Repair',
        image: 'https://images.unsplash.com/photo-1585704032915-c3400ca199e7',
        price: 449,
        rating: 4.6,
        reviewCount: 48,
        duration: '1 - 2 hours',
        description:
        'Geyser inspection and repair for heating, leakage and electrical problems.',
      ),

      ServiceModel(
        id: 'pest_1',
        categoryId: 'pest_control',
        name: 'Home Pest Control',
        image: 'https://images.unsplash.com/photo-1562259949-e8e7689d7828',
        price: 799,
        rating: 4.8,
        reviewCount: 142,
        duration: '2 - 3 hours',
        description:
        'Complete home pest control service to help protect your home from common household pests.',
      ),
      ServiceModel(
        id: 'pest_2',
        categoryId: 'pest_control',
        name: 'Cockroach Control',
        image: 'https://images.unsplash.com/photo-1584820927498-cfe5211fd8bf',
        price: 599,
        rating: 4.7,
        reviewCount: 113,
        duration: '1 - 2 hours',
        description:
        'Professional cockroach treatment for kitchens, bathrooms and other household areas.',
      ),
      ServiceModel(
        id: 'pest_3',
        categoryId: 'pest_control',
        name: 'Termite Control',
        image: 'https://images.unsplash.com/photo-1584820927498-cfe5211fd8bf',
        price: 1499,
        rating: 4.8,
        reviewCount: 87,
        duration: '2 - 3 hours',
        description:
        'Professional termite inspection and treatment to protect wooden structures and furniture.',
      ),
      ServiceModel(
        id: 'pest_4',
        categoryId: 'pest_control',
        name: 'Mosquito Control',
        image: 'https://images.unsplash.com/photo-1584820927498-cfe5211fd8bf',
        price: 699,
        rating: 4.6,
        reviewCount: 75,
        duration: '1 - 2 hours',
        description:
        'Mosquito control treatment for common household areas and outdoor spaces.',
      ),
      ServiceModel(
        id: 'pest_5',
        categoryId: 'pest_control',
        name: 'Bed Bug Control',
        image: 'https://images.unsplash.com/photo-1584820927498-cfe5211fd8bf',
        price: 999,
        rating: 4.7,
        reviewCount: 64,
        duration: '2 - 3 hours',
        description:
        'Professional bed bug treatment for bedrooms, mattresses and furniture.',
      ),
    ];
  }
}