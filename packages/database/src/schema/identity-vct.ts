/**
 * Identity-VCT schema – Module quản lý danh tính VCT (Vovinam / Việt võ đạo).
 * Bảng users dùng UUID v7 (time-ordered). Yêu cầu extension: CREATE EXTENSION pg_uuidv7;
 */
import { date, pgTable, text, uuid } from "drizzle-orm/pg-core";
import { sql } from "drizzle-orm";

export const users = pgTable("users", {
  /** UUID v7 – time-ordered, sinh bởi uuid_generate_v7() (extension pg_uuidv7) */
  id: uuid("id")
    .primaryKey()
    .default(sql`gen_random_uuid()`),
  /** Họ và tên */
  fullName: text("full_name").notNull(),
  /** Ngày sinh */
  dateOfBirth: date("date_of_birth", { mode: "date" }).notNull(),
  /** Môn phái (ví dụ: Vovinam, Việt võ đạo, …) */
  martialArtStyle: text("martial_art_style").notNull(),
  /** Cấp bậc / đai (ví dụ: trắng, vàng, đen, …) */
  rank: text("rank").notNull(),
});

export type User = typeof users.$inferSelect;
export type NewUser = typeof users.$inferInsert;
