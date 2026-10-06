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
    ];
  }
}