import { faInbox, faBullhorn, faPencilAlt, faGraduationCap } from "@fortawesome/free-solid-svg-icons";

const schedule = [
	{
		event: "Deadline Penyisihan\u00a01",
		date: new Date("2022-09-17T23:59+07:00"),
		icon: faInbox,
	},
	{
		event: "Live Class Brilliant Competition",
		date: new Date("2022-09-18T23:59+07:00"),
		icon: faGraduationCap,
	},
	{
		event: "Penyisihan 2 & Semifinal",
		date: new Date("2022-09-23T23:59+07:00"),
		icon: faPencilAlt,
	},
	{
		event: "Final",
		date: new Date("2022-09-24T23:59+07:00"),
		icon: faPencilAlt,
	},
];

export default schedule;
