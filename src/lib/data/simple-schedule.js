import { faInbox, faBullhorn, faPencilAlt } from "@fortawesome/free-solid-svg-icons";

const schedule = [
	{
		event: "Deadline Penyisihan\u00a01",
		date: new Date("2022-09-17T23:59+07:00"),
		icon: faInbox,
	},
	{
		event: "Penyisihan 2 & Semifinal",
		date: new Date("2022-09-21T23:59+07:00"),
		icon: faPencilAlt,
	},
	{
		event: "Final",
		date: new Date("2022-09-24T23:59+07:00"),
		icon: faPencilAlt,
	},
];

export default schedule;
