import { faInbox, faBullhorn, faPencilAlt } from "@fortawesome/free-solid-svg-icons";

const schedule = [
	{
		event: "Deadline Penyisihan\u00a01",
		date: new Date("2021-09-01T23:59+07:00"),
		icon: faInbox,
	},
	{
		event: "Penyisihan 2",
		date: new Date("2021-09-06T23:59+07:00"),
		icon: faPencilAlt,
	},
	{
		event: "Semifinal",
		date: new Date("2021-09-07T23:59+07:00"),
		icon: faPencilAlt,
	},
	{
		event: "Final",
		date: new Date("2021-09-10T23:59+07:00"),
		icon: faPencilAlt,
	},
];

export default schedule;
