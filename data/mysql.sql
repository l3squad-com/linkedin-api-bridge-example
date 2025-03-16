-- Create Database
CREATE DATABASE IF NOT EXISTS linkedin_db;
USE linkedin_db;

-- Table: user
CREATE TABLE IF NOT EXISTS user (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    profile_image VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    is_deleted BOOLEAN DEFAULT FALSE,
    deleted_by BIGINT DEFAULT NULL,
    deleted_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table: user_post
CREATE TABLE IF NOT EXISTS user_post (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    content TEXT NOT NULL,
    media_url VARCHAR(255),
    visibility ENUM('public', 'connections', 'private') DEFAULT 'public',
    is_active BOOLEAN DEFAULT TRUE,
    is_deleted BOOLEAN DEFAULT FALSE,
    deleted_by BIGINT DEFAULT NULL,
    deleted_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
);

-- Table: post_like
CREATE TABLE IF NOT EXISTS post_like (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    post_id BIGINT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    is_deleted BOOLEAN DEFAULT FALSE,
    deleted_by BIGINT DEFAULT NULL,
    deleted_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE(user_id, post_id),
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES user_post(id) ON DELETE CASCADE
);

-- Table: post_comment
CREATE TABLE IF NOT EXISTS post_comment (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    post_id BIGINT NOT NULL,
    comment_text TEXT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    is_deleted BOOLEAN DEFAULT FALSE,
    deleted_by BIGINT DEFAULT NULL,
    deleted_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES user_post(id) ON DELETE CASCADE
);

-- Insert Dummy Users
INSERT INTO user (full_name, email, profile_image) VALUES
('John Doe', 'john.doe@example.com', 'john_profile.jpg'),
('Jane Smith', 'jane.smith@example.com', 'jane_profile.jpg'),
('Alice Johnson', 'alice.johnson@example.com', 'alice_profile.jpg');

-- Insert Dummy User Posts
INSERT INTO user_post (user_id, content, media_url, visibility) VALUES
(1, 'Excited to start my new job at TechCorp!', 'post1.jpg', 'public'),
(2, 'Just attended an amazing AI conference!', 'post2.jpg', 'connections'),
(3, 'My latest blog post on cloud computing is live!', NULL, 'public');

-- Insert Dummy Post Likes
INSERT INTO post_like (user_id, post_id) VALUES
(1, 2),
(2, 3),
(3, 1);

-- Insert Dummy Post Comments
INSERT INTO post_comment (user_id, post_id, comment_text) VALUES
(2, 1, 'Congratulations, John! Best of luck!'),
(3, 2, 'AI conferences are always insightful. What was your biggest takeaway?'),
(1, 3, 'Great article on cloud computing, Alice!');
