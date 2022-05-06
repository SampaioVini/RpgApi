using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace RpgApi.Migrations
{
    public partial class MigracaoPerfil : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Perfil",
                table: "Usuarios",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "Jogador");

            migrationBuilder.UpdateData(
                table: "Usuarios",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "PasswordHash", "PasswordSalt", "Username" },
                values: new object[] { new byte[] { 248, 116, 170, 162, 247, 204, 188, 210, 202, 51, 48, 185, 16, 5, 74, 166, 75, 4, 40, 155, 50, 147, 207, 13, 68, 138, 245, 107, 216, 56, 71, 199, 189, 226, 195, 13, 229, 200, 220, 179, 242, 75, 214, 33, 154, 65, 217, 40, 110, 137, 24, 82, 201, 243, 223, 124, 128, 230, 67, 40, 176, 230, 110, 125 }, new byte[] { 203, 215, 192, 148, 108, 213, 30, 171, 167, 147, 19, 239, 3, 72, 205, 118, 18, 181, 102, 68, 143, 167, 191, 246, 100, 160, 155, 158, 34, 48, 152, 0, 0, 24, 17, 115, 163, 188, 213, 197, 195, 4, 44, 234, 243, 94, 144, 252, 197, 78, 191, 112, 181, 208, 56, 235, 232, 242, 140, 120, 151, 200, 76, 224, 229, 205, 186, 204, 58, 37, 174, 55, 217, 80, 186, 79, 55, 158, 3, 198, 46, 62, 127, 47, 216, 215, 106, 143, 167, 65, 163, 135, 26, 201, 127, 172, 220, 22, 154, 39, 67, 102, 77, 90, 235, 197, 169, 156, 158, 255, 224, 94, 133, 89, 235, 12, 55, 170, 65, 170, 105, 236, 135, 32, 65, 186, 43, 43 }, "UsuarioAdmin" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Perfil",
                table: "Usuarios");

            migrationBuilder.UpdateData(
                table: "Usuarios",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "PasswordHash", "PasswordSalt", "Username" },
                values: new object[] { new byte[] { 3, 161, 58, 148, 57, 243, 35, 18, 158, 191, 6, 217, 95, 119, 114, 90, 97, 250, 223, 38, 144, 114, 254, 141, 156, 137, 87, 214, 0, 213, 1, 167, 104, 121, 195, 248, 204, 221, 251, 216, 205, 39, 95, 24, 144, 146, 185, 94, 15, 217, 230, 158, 196, 93, 120, 141, 209, 104, 55, 143, 125, 40, 250, 245 }, new byte[] { 185, 98, 127, 23, 226, 32, 71, 144, 119, 172, 187, 166, 139, 225, 213, 196, 72, 143, 17, 45, 12, 43, 127, 185, 40, 211, 105, 185, 91, 145, 145, 229, 64, 174, 48, 5, 18, 159, 92, 48, 110, 93, 170, 35, 67, 16, 120, 114, 228, 112, 145, 151, 54, 191, 194, 124, 23, 176, 116, 183, 243, 28, 27, 4, 52, 27, 121, 240, 246, 227, 251, 24, 95, 116, 192, 180, 201, 86, 34, 202, 94, 225, 10, 82, 31, 58, 77, 43, 223, 8, 41, 150, 53, 124, 50, 112, 149, 109, 170, 2, 244, 42, 246, 8, 17, 155, 187, 11, 91, 122, 163, 62, 129, 204, 162, 128, 22, 167, 205, 57, 131, 180, 113, 237, 104, 136, 56, 139 }, null });
        }
    }
}
