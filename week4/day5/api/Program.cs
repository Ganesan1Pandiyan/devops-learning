using Npgsql;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();
var connStr = builder.Configuration.GetConnectionString("Default");

app.MapGet("/", () => "Ganesan's Learning API is running!");

app.MapGet("/learning", async () =>
{
    await using var conn = new NpgsqlConnection(connStr);
    await conn.OpenAsync();
    await using var cmd = new NpgsqlCommand(
        "SELECT week, topic FROM learning ORDER BY week", conn);
    await using var reader = await cmd.ExecuteReaderAsync();

    var list = new List<object>();
    while (await reader.ReadAsync())
        list.Add(new { week = reader.GetInt32(0), topic = reader.GetString(1) });
    return list;
});

app.Run();
