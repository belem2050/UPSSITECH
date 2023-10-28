import java.awt.Point;

public enum Direction {
	NORD , SUD, EST, OUEST;

	public Point getPointSuivant(Point point) {
        Point point2;
        switch (this) {
            case EST -> point2 = new Point(point.x, point.y + 1);
            case OUEST -> point2 = new Point(point.x, point.y - 1);
            case SUD -> point2 = new Point(point.x + 1, point.y);
            default -> point2 = new Point(point.x - 1, point.y);
        }
        return point2;
    }
}
