defmodule MelliferaWeb.PageController do
  use MelliferaWeb, :controller

  def index(conn, _params) do
    qnas = [
      %{
        q: "Kapan hari terakhir pendaftaran?",
        a: "Rabu, 1 September 2021"
      },
      %{
        q: "Bolehkan satu tim untuk seorang saja?",
        a: "Boleh"
      },
      %{
        q: "Berapa biaya pendaftaran?",
        a: "Rp 100.000,- per tim s.d. 19 Agustus 2021 dan Rp 125.000,- setelahnya"
      },
      %{
        q: "Berapa banyak tim yang akan lolos dari penyisihan 2 ke semifinal?",
        a: "16 tim"
      },
      %{
        q: "Berapa banyak tim yang akan lolos dari semifinal ke final?",
        a: "5 tim"
      },
      %{
        q: "Apa format Brilliant Competition tahun ini?",
        a:
          "Brilliant Competition mengadakan 2 perlombaan tim, yaitu lomba matematika dan lomba IPA, dengan 1 tim terdiri akan sebanyak-banyaknya 2 orang"
      },
      %{
        q: "Apakah ada silabus untuk Brilliant Competition tahun ini?",
        a: "Tidak ada, materi Brilliant Competition tahun ini berkisar materi OSN SMP."
      }
    ]

    simple_schedule = [
      %{
        event: "Deadline Penyisihan\u00a01",
        date: Date.new!(2021, 09, 01),
        icon: "fa-inbox"
      },
      %{
        event: "Penyisihan 2",
        date: Date.new!(2021, 09, 06),
        icon: "fa-pencil-alt"
      },
      %{
        event: "Semifinal",
        date: Date.new!(2021, 09, 07),
        icon: "fa-pencil-alt"
      },
      %{
        event: "Final",
        date: Date.new!(2021, 09, 10),
        icon: "fa-pencil-alt"
      }
    ]

    detailed_schedule = [
      %{
        date: "Jumat, 3 Sept 2021",
        events: [
          %{
            time: "15:00",
            event: "Pengumuman Penyisihan\u00a01"
          }
        ]
      },
      %{
        date: "Sabtu, 4 Sept 2021",
        events: [
          %{
            time: "15:00",
            event: "Tech Meet Penyisihan 2"
          }
        ]
      },
      %{
        date: "Senin, 6 Sept 2021",
        events: [
          %{
            time: "08:00–10:00",
            event: "Pembukaan Acara"
          },
          %{
            time: "10:00–11:15",
            event: "Penyisihan\u00a02"
          },
          %{
            time: "17:00",
            event: "Pengumuman Penyisihan\u00a02 dan Tech Meet Semifinal"
          }
        ]
      },
      %{
        date: "Selasa, 7 Sept 2021",
        events: [
          %{
            time: "08:00–09:00",
            event: "Pembukaan Semifinal Matematika"
          },
          %{
            time: "09:00–12:00",
            event: "Semifinal Matematika"
          },
          %{
            time: "13:00–14:00",
            event: "Pembukaan Semifinal IPA"
          },
          %{
            time: "14:00–16:00",
            event: "Semifinal IPA"
          }
        ]
      },
      %{
        date: "Kamis, 9 Sept 2021",
        events: [
          %{
            time: "15:00",
            event: "Pengumuman Semifinal"
          },
          %{
            time: "17:00",
            event: "Tech Meet Final"
          }
        ]
      },
      %{
        date: "Jumat, 10 Sept 2021",
        events: [
          %{
            time: "07:30-Selesai",
            event: "Final"
          }
        ]
      }
    ]

    conn =
      conn
      |> Plug.Conn.assign(:qnas, qnas)
      |> Plug.Conn.assign(:simple_schedule, simple_schedule)
      |> Plug.Conn.assign(:detailed_schedule, detailed_schedule)

    render(conn, "index.html")
  end
end
