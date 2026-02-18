import "@typespec/http";
import "@typespec/rest";

using TypeSpec.Http;
using TypeSpec.Rest;

@doc("Identity module API (VCT). Data fields match packages/database Identity-VCT schema.")
@service({ title: "Identity API" })
namespace Identity;

@doc("UUID string. In this module, IDs are expected to be UUID v7.")
@format("uuid")
scalar Uuid extends string;

@doc("User record (khớp với schema users trong packages/database).")
model User {
  id: Uuid;
  fullName: string;
  dateOfBirth: plainDate;
  martialArtStyle: string;
  rank: string;
}

@doc("Profile view of a user (hiện tại trùng shape với User để khớp schema).")
model Profile {
  id: Uuid;
  fullName: string;
  dateOfBirth: plainDate;
  martialArtStyle: string;
  rank: string;
}

@doc("Payload đăng ký user mới. (id được sinh bởi hệ thống/DB - UUID v7)")
model RegisterRequest {
  fullName: string;
  dateOfBirth: plainDate;
  martialArtStyle: string;
  rank: string;
}

@doc("Payload cập nhật rank/đai cho user.")
model UpdateRankRequest {
  id: Uuid;
  rank: string;
}

interface IdentityRoutes {
  @doc("Đăng ký tài khoản.")
  @route("/register")
  @post
  op register(@body body: RegisterRequest): User;

  @doc("Lấy profile theo id.")
  @route("/profile/{id}")
  @get
  op getProfile(@path id: Uuid): Profile;

  @doc("Cập nhật rank/đai cho user theo id.")
  @route("/rank")
  @patch
  op updateRank(@body body: UpdateRankRequest): Profile;
}

