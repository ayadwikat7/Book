<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class BookSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('books')->insert([
            [
                'title' => 'Rich Dad And Poor Dad',
                'author' => 'Robert T. Kiyosaki',
                'image' => 'https://m.media-amazon.com/images/I/81BE7eeKzAL._SL1500_.jpg',
                'background_image' => 'https://m.media-amazon.com/images/I/91-DDoSqBaL._UF1000,1000_QL80_.jpg',
                'price' => 30.00,
                'old_price' => 45.00,
                'rating' => 4.5,
                'reviews' => 180,
                'in_stock' => true,
                'description' => 'A personal finance classic that contrasts the mindset of the rich with that of the poor, teaching how to achieve financial independence through investments and smart money management.',
            ],
            [
                'title' => 'Atomic Habits',
                'author' => 'James Clear',
                'image' => 'https://m.media-amazon.com/images/I/81ANaVZk5LL.jpg',
                'background_image' => 'https://m.media-amazon.com/images/I/91euIoR1Q4L._UF1000,1000_QL80_.jpg',
                'price' => 38.00,
                'old_price' => 50.00,
                'rating' => 5.0,
                'reviews' => 220,
                'in_stock' => true,
                'description' => 'This book explains how small, consistent habits can lead to remarkable results over time, focusing on the power of atomic habits and system-based improvement.',
            ],
            [
                'title' => 'The Alchemist',
                'author' => 'Paulo Coelho',
                'image' => 'https://m.media-amazon.com/images/I/71aFt4+OTOL.jpg',
                'background_image' => 'https://m.media-amazon.com/images/I/91YeqtEPk4L._UF1000,1000_QL80_.jpg',
                'price' => 35.00,
                'old_price' => 40.00,
                'rating' => 4.0,
                'reviews' => 150,
                'in_stock' => true,
                'description' => 'A philosophical novel that follows Santiago on his journey to find a hidden treasure, teaching about destiny, dreams, and self-discovery.',
            ],
            [
                'title' => 'Deep Work',
                'author' => 'Cal Newport',
                'image' => 'https://m.media-amazon.com/images/I/71din4TLubL._UF1000,1000_QL80_.jpg',
                'background_image' => 'https://m.media-amazon.com/images/I/81rKl4dNAtS._UF1000,1000_QL80_.jpg',
                'price' => 42.00,
                'old_price' => 55.00,
                'rating' => 4.8,
                'reviews' => 200,
                'in_stock' => true,
                'description' => 'Cal Newport teaches how deep, focused work leads to success in a distracted world, offering strategies to master focus and productivity.',
            ],
            [
                'title' => 'Think and Grow Rich',
                'author' => 'Napoleon Hill',
                'image' => 'https://m.media-amazon.com/images/I/61IxJuRI39L.jpg',
                'background_image' => 'https://laz-img-sg.alicdn.com/p/7c6949ab5a3008e16f829ea50ff8fd0b.jpg',
                'price' => 30.00,
                'old_price' => 39.00,
                'rating' => 4.3,
                'reviews' => 300,
                'in_stock' => true,
                'description' => 'A timeless guide to success that outlines Napoleon Hill’s 13 principles for building wealth, based on interviews with famous millionaires.',
            ],
            [
                'title' => 'The Power of Now',
                'author' => 'Eckhart Tolle',
                'image' => 'https://upload.wikimedia.org/wikipedia/en/6/66/TPON_Cover_LG.jpg',
                'background_image' => 'https://m.media-amazon.com/images/I/81Z9kq9jwTL._UF350,350_QL80_.jpg',
                'price' => 28.00,
                'old_price' => 35.00,
                'rating' => 4.6,
                'reviews' => 250,
                'in_stock' => false,
                'description' => 'A spiritual guide focusing on living fully in the present moment, breaking free from the ego, and finding inner peace.',
            ],
            [
                'title' => '1984',
                'author' => 'George Orwell',
                'image' => 'https://prodimage.images-bn.com/pimages/9780452262935_p0_v6_s600x595.jpg',
                'background_image' => 'https://m.media-amazon.com/images/I/71mz6I4tQ1L._UF1000,1000_QL80_.jpg',
                'price' => 32.00,
                'old_price' => 40.00,
                'rating' => 4.7,
                'reviews' => 270,
                'in_stock' => true,
                'description' => 'A dystopian novel depicting a totalitarian regime and the suppression of free thought, warning against the dangers of absolute power.',
            ],
            [
                'title' => 'Harry Potter and the Sorcerer\'s Stone',
                'author' => 'J.K. Rowling',
                'image' => 'https://m.media-amazon.com/images/I/81iqZ2HHD-L.jpg',
                'background_image' => 'https://m.media-amazon.com/images/I/81iqZ2HHD-L.jpg',
                'price' => 45.00,
                'old_price' => 60.00,
                'rating' => 5.0,
                'reviews' => 500,
                'in_stock' => true,
                'description' => 'The first book in the Harry Potter series, introducing the magical world of Hogwarts and the adventures of Harry and his friends.',
            ],
            [
                'title' => 'To Kill a Mockingbird',
                'author' => 'Harper Lee',
                'image' => 'https://i5.walmartimages.com/seo/Go-Set-a-Watchman-Paperback-9780062433657_6bae0746-0b3d-49fc-802c-853e5124d207.e8c6163a6f221e8ed18f529a22f9469b.jpeg',
                'background_image' => 'https://m.media-amazon.com/images/I/71KnJkC9wSL._UF1000,1000_QL80_.jpg',
                'price' => 36.00,
                'old_price' => 50.00,
                'rating' => 4.9,
                'reviews' => 420,
                'in_stock' => true,
                'description' => 'A classic novel set in the American South, addressing themes of racial injustice, moral growth, and compassion through the eyes of a young girl.',
            ],
        ]);
    }
}
