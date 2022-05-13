using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace RpgApi.Migrations
{
    public partial class MigracaoDisputas : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "Perfil",
                table: "Usuarios",
                type: "nvarchar(max)",
                nullable: true,
                defaultValue: "Jogador",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldDefaultValue: "Jogador");

            migrationBuilder.AddColumn<string>(
                name: "Email",
                table: "Usuarios",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Derrotas",
                table: "Personagens",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "Disputas",
                table: "Personagens",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "Vitorias",
                table: "Personagens",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "Disputas",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DataDisputa = table.Column<DateTime>(type: "datetime2", nullable: true),
                    AtacanteId = table.Column<int>(type: "int", nullable: false),
                    OponenteId = table.Column<int>(type: "int", nullable: false),
                    Narracao = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Disputas", x => x.Id);
                });

            migrationBuilder.UpdateData(
                table: "Usuarios",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "PasswordHash", "PasswordSalt" },
                values: new object[] { new byte[] { 80, 163, 101, 244, 211, 136, 86, 72, 249, 214, 115, 147, 119, 209, 148, 125, 122, 143, 45, 123, 93, 225, 242, 53, 198, 179, 197, 96, 72, 52, 207, 238, 127, 224, 135, 112, 134, 1, 132, 30, 198, 123, 75, 229, 147, 56, 51, 151, 33, 230, 63, 126, 7, 38, 215, 153, 113, 243, 68, 183, 222, 46, 56, 32 }, new byte[] { 35, 68, 14, 250, 95, 188, 22, 252, 143, 9, 170, 102, 160, 171, 66, 31, 36, 108, 187, 167, 72, 73, 94, 109, 53, 161, 62, 179, 189, 30, 177, 24, 215, 21, 137, 225, 246, 148, 132, 10, 42, 98, 97, 250, 245, 85, 30, 178, 255, 190, 189, 70, 145, 101, 116, 112, 167, 245, 58, 108, 112, 35, 31, 156, 8, 226, 113, 244, 229, 236, 234, 51, 138, 106, 25, 24, 245, 245, 159, 38, 87, 248, 196, 49, 123, 65, 134, 89, 174, 131, 165, 212, 213, 86, 45, 207, 96, 91, 14, 6, 91, 30, 40, 48, 175, 35, 175, 22, 249, 167, 166, 138, 210, 166, 37, 96, 4, 22, 57, 82, 68, 49, 220, 37, 147, 192, 223, 90 } });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Disputas");

            migrationBuilder.DropColumn(
                name: "Email",
                table: "Usuarios");

            migrationBuilder.DropColumn(
                name: "Derrotas",
                table: "Personagens");

            migrationBuilder.DropColumn(
                name: "Disputas",
                table: "Personagens");

            migrationBuilder.DropColumn(
                name: "Vitorias",
                table: "Personagens");

            migrationBuilder.AlterColumn<string>(
                name: "Perfil",
                table: "Usuarios",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "Jogador",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true,
                oldDefaultValue: "Jogador");

            migrationBuilder.UpdateData(
                table: "Usuarios",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "PasswordHash", "PasswordSalt" },
                values: new object[] { new byte[] { 248, 116, 170, 162, 247, 204, 188, 210, 202, 51, 48, 185, 16, 5, 74, 166, 75, 4, 40, 155, 50, 147, 207, 13, 68, 138, 245, 107, 216, 56, 71, 199, 189, 226, 195, 13, 229, 200, 220, 179, 242, 75, 214, 33, 154, 65, 217, 40, 110, 137, 24, 82, 201, 243, 223, 124, 128, 230, 67, 40, 176, 230, 110, 125 }, new byte[] { 203, 215, 192, 148, 108, 213, 30, 171, 167, 147, 19, 239, 3, 72, 205, 118, 18, 181, 102, 68, 143, 167, 191, 246, 100, 160, 155, 158, 34, 48, 152, 0, 0, 24, 17, 115, 163, 188, 213, 197, 195, 4, 44, 234, 243, 94, 144, 252, 197, 78, 191, 112, 181, 208, 56, 235, 232, 242, 140, 120, 151, 200, 76, 224, 229, 205, 186, 204, 58, 37, 174, 55, 217, 80, 186, 79, 55, 158, 3, 198, 46, 62, 127, 47, 216, 215, 106, 143, 167, 65, 163, 135, 26, 201, 127, 172, 220, 22, 154, 39, 67, 102, 77, 90, 235, 197, 169, 156, 158, 255, 224, 94, 133, 89, 235, 12, 55, 170, 65, 170, 105, 236, 135, 32, 65, 186, 43, 43 } });
        }
    }
}
