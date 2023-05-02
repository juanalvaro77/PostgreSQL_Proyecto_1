CREATE TABLE "users" (
  "id" BIGSERIAL PRIMARY KEY,
  "userFirstName" varchar(30) NOT NULL,
  "userLastName" varchar(30) NOT NULL,
  "userEmail" varchar(50) NOT NULL,
  "userPassword" varchar(16) NOT NULL,
  "userAge" int NOT NULL,
  "userCourses_id" int NOT NULL,
  "userRole_id" int NOT NULL,
  "userGender_id" int NOT NULL
);

CREATE TABLE "courses" (
  "id" BIGSERIAL PRIMARY KEY,
  "course_title" varchar(50) NOT NULL,
  "course_description" varchar NOT NULL,
  "course_level_id" int NOT NULL,
  "course_teacher_id" int NOT NULL,
  "course_category_id" int NOT NULL,
  "course_video_id" int NOT NULL
);

CREATE TABLE "course_videos" (
  "id" BIGSERIAL PRIMARY KEY,
  "video_title" varchar(50) NOT NULL,
  "video_url" varchar NOT NULL
);

CREATE TABLE "course_levels" (
  "id" BIGSERIAL PRIMARY KEY,
  "course_level" varchar(30) NOT NULL
);

CREATE TABLE "roles" (
  "id" BIGSERIAL PRIMARY KEY,
  "role" varchar(30) NOT NULL
);

CREATE TABLE "categories" (
  "id" BIGSERIAL PRIMARY KEY,
  "category" varchar(50) NOT NULL
);

CREATE TABLE "users_courses" (
  "id" BIGSERIAL PRIMARY KEY,
  "courses_id" int NOT NULL,
  "users_id" int NOT NULL
);

CREATE TABLE "gender" (
  "id" BIGSERIAL PRIMARY KEY,
  "gender" varchar(10) NOT NULL
);

ALTER TABLE "users" ADD FOREIGN KEY ("userRole_id") REFERENCES "roles" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("userGender_id") REFERENCES "gender" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("course_video_id") REFERENCES "course_videos" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("course_category_id") REFERENCES "categories" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("course_level_id") REFERENCES "course_levels" ("id");
