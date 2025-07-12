-- Seed data for ReWear platform

-- Insert categories
INSERT INTO categories (name, slug, description) VALUES
('Tops', 'tops', 'T-shirts, blouses, sweaters, and other upper body clothing'),
('Bottoms', 'bottoms', 'Pants, jeans, skirts, and shorts'),
('Dresses', 'dresses', 'All types of dresses and jumpsuits'),
('Outerwear', 'outerwear', 'Jackets, coats, blazers, and cardigans'),
('Shoes', 'shoes', 'All types of footwear'),
('Accessories', 'accessories', 'Bags, jewelry, scarves, and other accessories'),
('Activewear', 'activewear', 'Sports and fitness clothing'),
('Formal', 'formal', 'Formal and business attire');

-- Insert sample users
INSERT INTO users (email, password_hash, first_name, last_name, points, total_swaps, rating) VALUES
('sarah@example.com', '$2b$10$example_hash_1', 'Sarah', 'Miller', 125, 8, 4.8),
('emma@example.com', '$2b$10$example_hash_2', 'Emma', 'Johnson', 89, 12, 4.9),
('mike@example.com', '$2b$10$example_hash_3', 'Mike', 'Rodriguez', 156, 15, 4.7),
('lisa@example.com', '$2b$10$example_hash_4', 'Lisa', 'Thompson', 67, 5, 4.6),
('anna@example.com', '$2b$10$example_hash_5', 'Anna', 'Peterson', 203, 22, 4.9),
('tom@example.com', '$2b$10$example_hash_6', 'Tom', 'Wilson', 45, 3, 4.5),
('admin@rewear.com', '$2b$10$example_hash_admin', 'Admin', 'User', 0, 0, 0.0);

-- Update admin user role
UPDATE users SET role = 'admin' WHERE email = 'admin@rewear.com';

-- Insert sample items
INSERT INTO items (user_id, title, description, category_id, item_type, size, condition, points, status, featured, views, likes) VALUES
(1, 'Vintage Denim Jacket', 'Beautiful vintage denim jacket in excellent condition. This classic piece features authentic distressing and a timeless cut that works with any outfit.', 4, 'clothing', 'M', 'good', 25, 'active', true, 47, 8),
(2, 'Floral Summer Dress', 'Light and airy floral dress perfect for summer. Made from breathable cotton with a flattering A-line silhouette.', 3, 'clothing', 'S', 'excellent', 20, 'active', true, 32, 12),
(3, 'Designer Sneakers', 'High-end designer sneakers in great condition. Only worn a few times, still have original box.', 5, 'shoes', '9', 'good', 35, 'active', true, 28, 6),
(4, 'Wool Winter Coat', 'Warm and stylish wool coat perfect for cold weather. Classic design that never goes out of style.', 4, 'clothing', 'L', 'excellent', 40, 'active', false, 19, 4),
(5, 'Silk Blouse', 'Elegant silk blouse perfect for work or special occasions. Timeless design in a beautiful cream color.', 1, 'clothing', 'M', 'good', 18, 'active', false, 15, 3),
(6, 'Leather Boots', 'Genuine leather boots with minimal wear. Perfect for fall and winter styling.', 5, 'shoes', '8', 'fair', 30, 'active', false, 22, 5),
(1, 'Vintage Band T-Shirt', 'Authentic vintage band t-shirt from the 90s. Soft cotton with classic graphics.', 1, 'clothing', 'L', 'good', 15, 'pending', false, 0, 0),
(2, 'Designer Handbag', 'Luxury designer handbag in excellent condition. Comes with authenticity certificate.', 6, 'accessories', 'One Size', 'excellent', 45, 'pending', false, 0, 0);

-- Insert item images
INSERT INTO item_images (item_id, image_url, is_primary, sort_order) VALUES
(1, '/placeholder.svg?height=600&width=600', true, 0),
(1, '/placeholder.svg?height=600&width=600&text=Back', false, 1),
(1, '/placeholder.svg?height=600&width=600&text=Detail', false, 2),
(2, '/placeholder.svg?height=600&width=600', true, 0),
(2, '/placeholder.svg?height=600&width=600&text=Detail', false, 1),
(3, '/placeholder.svg?height=600&width=600', true, 0),
(4, '/placeholder.svg?height=600&width=600', true, 0),
(5, '/placeholder.svg?height=600&width=600', true, 0),
(6, '/placeholder.svg?height=600&width=600', true, 0),
(7, '/placeholder.svg?height=600&width=600', true, 0),
(8, '/placeholder.svg?height=600&width=600', true, 0);

-- Insert item tags
INSERT INTO item_tags (item_id, tag) VALUES
(1, 'vintage'), (1, 'denim'), (1, 'casual'),
(2, 'floral'), (2, 'summer'), (2, 'casual'),
(3, 'designer'), (3, 'sneakers'), (3, 'athletic'),
(4, 'wool'), (4, 'winter'), (4, 'formal'),
(5, 'silk'), (5, 'formal'), (5, 'work'),
(6, 'leather'), (6, 'boots'), (6, 'winter'),
(7, 'vintage'), (7, 'band'), (7, 'casual'),
(8, 'designer'), (8, 'luxury'), (8, 'handbag');

-- Insert sample swaps
INSERT INTO swaps (requester_id, owner_id, item_id, message, status, swap_type, created_at) VALUES
(2, 1, 1, 'Hi! I love this jacket. Would you be interested in swapping for my summer dress?', 'completed', 'direct', '2024-01-15 10:30:00'),
(3, 4, 4, 'Great coat! I have some designer items I could trade.', 'pending', 'direct', '2024-01-20 14:15:00'),
(5, 2, 2, NULL, 'completed', 'points', '2024-01-10 09:45:00');

-- Update points used for point-based swaps
UPDATE swaps SET points_used = 20 WHERE swap_type = 'points' AND item_id = 2;

-- Insert sample favorites
INSERT INTO user_favorites (user_id, item_id) VALUES
(2, 1), (2, 4), (3, 2), (4, 3), (5, 1), (6, 5);

-- Insert sample reports
INSERT INTO reports (reporter_id, item_id, reason, description, status) VALUES
(2, 8, 'Inappropriate content', 'This listing seems suspicious and may not be authentic.', 'pending');

-- Insert sample point transactions
INSERT INTO point_transactions (user_id, amount, transaction_type, reference_id, description) VALUES
(1, 25, 'swap_completed', 1, 'Points earned from completed swap'),
(2, -20, 'item_redeemed', 3, 'Points spent on item redemption'),
(2, 20, 'swap_completed', 1, 'Points earned from completed swap'),
(3, 15, 'item_listed', 3, 'Bonus points for listing quality item'),
(4, 30, 'swap_completed', 2, 'Points earned from completed swap'),
(5, -20, 'item_redeemed', 3, 'Points spent on item redemption');

-- Insert sample notifications
INSERT INTO notifications (user_id, title, message, type, reference_id) VALUES
(1, 'Swap Request Received', 'Emma Johnson wants to swap for your Vintage Denim Jacket', 'swap_request', 1),
(2, 'Swap Completed', 'Your swap with Sarah Miller has been completed!', 'swap_completed', 1),
(1, 'Item Approved', 'Your Vintage Denim Jacket has been approved and is now live!', 'item_approved', 1),
(7, 'New Item Pending', 'A new item "Vintage Band T-Shirt" is pending approval', 'admin_item_pending', 7),
(7, 'Content Reported', 'An item has been reported and needs review', 'admin_content_reported', 8);
